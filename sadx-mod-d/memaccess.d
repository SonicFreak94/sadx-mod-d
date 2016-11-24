module memaccess;

import core.sys.windows.windows;
import std.string;
import std.array;
import std.traits;

/**
* SADX Mod Loader.
* Memory access inline functions.
*/

/**
* Get the number of elements in an array.
* @return Number of elements in the array.
*/
static auto LengthOfArray(T)(T t)
{
	static assert(isArray!(T));
	return t.length;
}

/**
* Get the size of an array.
* @return Size of the array, in bytes.
*/
static auto SizeOfArray(T)(T t)
{
	static assert(isArray!(T));
	return t.empty ? 0 : typeof(*t.ptr).sizeof * t.length;
}

// Macros for functions that need both an array
// and the array length or size.
template arrayptrandlength(data)
{
	static assert(isArray!(data));
	mixin("data, LengthOfArray(data)");
}
template arraylengthandptr(data)
{
	static assert(isArray!(data));
	mixin("LengthOfArray(data), data");
}
template arrayptrandsize(data)
{
	static assert(isArray!(data));
	mixin("data, SizeOfArray(data)");
}
template arraysizeandptr(data)
{
	static assert(isArray!(data));
	mixin("SizeOfArray(data), data");
}

static BOOL WriteData(void* writeaddress, const void* data, SIZE_T datasize, SIZE_T* byteswritten)
{
	return WriteProcessMemory(GetCurrentProcess(), writeaddress, data, datasize, byteswritten);
}

static BOOL WriteData(void* writeaddress, const void* data, SIZE_T datasize)
{
	return WriteData(writeaddress, data, datasize, null);
}

static BOOL WriteData(T)(const T* writeaddress, const T data, SIZE_T* byteswritten)
{
	return WriteData(cast(void*)writeaddress, cast(void*)&data, cast(SIZE_T)T.sizeof, byteswritten);
}

static BOOL WriteData(T)(const T* writeaddress, const T data)
{
	return WriteData(writeaddress, data, null);
}

static BOOL WriteData(T)(T* writeaddress, in T data, SIZE_T* byteswritten)
{
	return WriteData(writeaddress, &data, sizeof(data), byteswritten);
}

static BOOL WriteData(T)(T* writeaddress, in T data)
{
	return WriteData(writeaddress, data, null);
}

static BOOL WriteData(T)(void* writeaddress, const T data, SIZE_T* byteswritten)
{
	static assert(isArray!(T));
	return WriteData(writeaddress, data.ptr, SizeOfArray(data), byteswritten);
}

static BOOL WriteData(T)(void* writeaddress, const T data)
{
	return WriteData(writeaddress, data, null);
}

/**
* Write a repeated byte to an arbitrary address.
* @param address	[in] Address.
* @param data		[in] Byte to write.
* @param count		[in] Number of repetitions.
* @param byteswritten	[out, opt] Number of bytes written.
* @return Nonzero on success; 0 on error (check GetLastError()).
*/
static BOOL WriteData(void* address, ubyte data, int count, SIZE_T* byteswritten)
{
	auto buf = replicate([ data ], count);
	int result = WriteData(address, buf.ptr, buf.length, byteswritten);
	buf.destroy();
	return result;
}

/**
* Write a repeated byte to an arbitrary address.
* @param address	[in] Address.
* @param data		[in] Byte to write.
* @param count		[in] Number of repetitions.
* @return Nonzero on success; 0 on error (check GetLastError()).
*/
static BOOL WriteData(void* address, ubyte data, int count)
{
	return WriteData(address, data, count, null);
}

/**
* Write a JMP instruction to an arbitrary address.
* @param writeaddress Address to insert the JMP instruction.
* @param funcaddress Address to JMP to.
* @return Nonzero on success; 0 on error (check GetLastError()).
*/
static BOOL WriteJump(void* writeaddress, void* funcaddress)
{
	ubyte[5] data;
	data[0] = 0xE9; // JMP DWORD (relative)
	*cast(int*)(data.ptr + 1) = cast(uint)funcaddress - (cast(uint)writeaddress + 5);
	return WriteData(writeaddress, data);
}

/**
* Write a CALL instruction to an arbitrary address.
* @param writeaddress Address to insert the CALL instruction.
* @param funcaddress Address to CALL.
* @return Nonzero on success; 0 on error (check GetLastError()).
*/
static BOOL WriteCall(void* writeaddress, void* funcaddress)
{
	ubyte[5] data;
	data[0] = 0xE8; // CALL DWORD (relative)
	*cast(int*)(data.ptr + 1) = cast(uint)funcaddress - (cast(uint)writeaddress + 5);
	return WriteData(writeaddress, data);
}

struct Reference(Type)
{
	private Type* __ptr;

	this(Type* address)
	{
		__ptr = address;
	}

	auto opUnary(string s)()
	{
		return mixin(s ~ "*__ptr");
	}
	auto opCast(T)()
	{
		static if (is(T == Type))
		{
			return *__ptr;
		}
		else
		{
			return cast(T)(*__ptr);
		}
	}
	auto opBinary(string s, T)(T value)
	{
		return mixin("*__ptr " ~ s ~ " value");
	}
	auto opEquals(string s)(T value)
	{
		return mixin("*__ptr " ~ s ~ " value");
	}
	auto opAssign(T)(T value)
	{
		return *__ptr = value;
	}
	auto opOpAssign(string s, T)(T value)
	{
		return mixin("*__ptr " ~ s ~ " value");
	}

	@property auto opDispatch(string name)()
	{
		return mixin("__ptr." ~ name);
	}

	@property auto opDispatch(string name, T)(T value)
	{
		mixin(`return __ptr.` ~ name ~ ` = value;`);
	}

	auto opDispatch(string name, Args...)(Args args)
	{
		static if (args.length)
		{
			static if (is(ReturnType!(mixin("Type." ~ name)) == void))
			{
				mixin(`__ptr.` ~ name ~ `(args);`);
			}
			else
			{
				mixin(`return __ptr.` ~ name ~ `(args);`);
			}
		}
		else
		{
			static if (is(ReturnType!(mixin("Type." ~ name)) == void))
			{
				mixin(`__ptr.` ~ name ~ `;`);
			}
			else
			{
				mixin(`return __ptr.` ~ name ~ `;`);
			}
		}
	}
}

// Data pointer and array declarations.

template DataPointer(type, string name, size_t address)
{
	import std.string : format;

	mixin(format("auto %2$s = Reference!(%1$s)(cast(%1$s*)0x%3$08X);", 
									  type.stringof, name, address));
}
template DataArray(type, string name, size_t address, size_t length)
{
	import std.string : format;

	mixin(format("const auto %2$s = cast(%1$s*)%3$s; const auto %2$s_Length = %4$s;",
									type.stringof, name, address, length));
}

// Function pointer declarations.

//#define FunctionPointer(RETURN_TYPE, NAME, ARGS, ADDRESS) \
//static RETURN_TYPE (__cdecl* const NAME)ARGS = (RETURN_TYPE (__cdecl*)ARGS)ADDRESS

template FunctionPointer(returnType, string name, string args, size_t address)
{
	import std.string : format;

	enum result = format("extern (C) const auto %2$s = cast(%1$s function%3$s)0x%4$08X;",
						 returnType.stringof, name, args, address);
	pragma(msg, result);
	mixin(result);
}

//#define StdcallFunctionPointer(RETURN_TYPE, NAME, ARGS, ADDRESS) \
//static RETURN_TYPE (__stdcall* const NAME)ARGS = (RETURN_TYPE (__stdcall*)ARGS)ADDRESS

template StdcallFunctionPointer(returnType, string name, string args, size_t address)
{
	import std.string : format;

	enum result = format("extern (Windows) const auto %2$s = cast(%1$s function%3$s)0x%4$08X;",
						 returnType.stringof, name, args, address);
	pragma(msg, result);
	mixin(result);
}

//#define FastcallFunctionPointer(RETURN_TYPE, NAME, ARGS, ADDRESS) \
//static RETURN_TYPE (__fastcall* const NAME)ARGS = (RETURN_TYPE (__fastcall*)ARGS)ADDRESS
//#define ThiscallFunctionPointer(RETURN_TYPE, NAME, ARGS, ADDRESS) \
//static RETURN_TYPE (__thiscall* const NAME)ARGS = (RETURN_TYPE (__thiscall*)ARGS)ADDRESS
//#define VoidFunc(NAME, ADDRESS) FunctionPointer(void,NAME,(void),ADDRESS)

//#define patchdecl(address,data) { (void*)address, arrayptrandsize(data) }
//#define ptrdecl(address,data) { (void*)address, (void*)data }
