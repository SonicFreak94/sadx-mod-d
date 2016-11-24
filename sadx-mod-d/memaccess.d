module memaccess;

import core.sys.windows.windows;
import std.string;
import std.array;
import std.algorithm;
import std.traits;

/**
* SADX Mod Loader.
* Memory access inline functions.
*/

// Types

// Wrapper structure used to emulate the C++ syntax: int& myInt = *(int*)0x12345678;
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

// Argument for function pointers. See MakeArg.
struct FunctionArg
{
	string type;
	string name;

	this(string type, string name)
	{
		this.type = type.idup;
		this.name = name.idup;
	}

	// Returns a string representation of the argument.
	// If the type is void, only the name is returned. Otherwise,
	// it returns the format: [type] [name].
	// Example: int myInt
	string toString()
	{
		return (type != "void" ? (type ~ " " ~ name) : name);
	}
}
// Creates a FunctionArg of type T.
// Example: MakeArg!int(myInt);
auto MakeArg(T)(string name)
{
	return FunctionArg(T.stringof, name);
}
// Joins an array of arguments together, separated by comma.
string toString(FunctionArg[] a)
{
	if (a.empty)
	{
		return null;
	}

	return a.map!(x => x.toString()).join(", ");
}


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

template _funcptr(string type, returnType, string name, FunctionArg[] args, size_t address)
{
	import std.string;
	import std.algorithm;
	import std.array;

	enum result = format("extern (%5$s) const auto %2$s = cast(%1$s function(%3$s))0x%4$08X;",
						 returnType.stringof, name, args.toString(), address, type);

	debug pragma(msg, result ~ "\n");
	mixin(result);
}

template FunctionPointer(returnType, string name, FunctionArg[] args, size_t address)
{
	mixin _funcptr!("C", returnType, name, args, address);
}

template StdcallFunctionPointer(returnType, string name, FunctionArg[] args, size_t address)
{
	mixin _funcptr!("Windows", returnType, name, args, address);
}

string wrapFunction(string[] registers, string returnType, string name, FunctionArg[] args, size_t address)
{
	Appender!(string) str;

	// Address declaration. Example:
	// const auto name_ptr = cast(void*)0x12345678;
	str.put(format("const auto %s_ptr = cast(void*)0x%08X;", name, address));

	// Function declaration. Example:
	// type name(args, args, args)
	// {
	str.put(format("\n%s %s(%s)\n{",
				   returnType, name, args.toString()));

	// Local copy of address. Example:
	// auto func_ptr = cast(uint)name_ptr;
	str.put("\n\tauto func_ptr = cast(uint)" ~ name ~ "_ptr;");

	// If the function has a return value, we should store it
	// and return it from this wrapper function later.
	bool has_return = returnType != "void";

	if (has_return)
	{
		// Return value. Example:
		// type result;
		str.put("\n\t" ~ returnType ~ " result;");
	}

	// asm
	// {
	str.put("\n\tasm\n\t{");

	foreach (i, arg; args)
	{
		str.put("\n\t\t");

		// For the first N arguments that are within the number of
		// given registers, use those registers. Otherwise, push.
		if (i < registers.length)
		{
			// Example:
			// mov ECX, myCoolArg
			str.put(format("mov %s, %s;", registers[i], arg.name));
		}
		else
		{
			str.put("push " ~ arg.name ~ ";");
		}
	}

	// Call the real function.
	str.put("\n\t\tcall far ptr [func_ptr];");

	if (has_return)
	{
		// Move the return value into our local variable.
		//		mov result, eax
		//	}
		//	return result;
		// }
		str.put("\n\t\tmov result, eax");
		str.put("\n\t}");
		str.put("\n\treturn result;\n}");
	}
	else
	{
		//	} (end of asm block
		// } (end of function)
		str.put("\n\t}\n}");
	}

	return str.data;
}

template FastcallFunctionPointer(returnType, string name, FunctionArg[] args, size_t address)
{
	static if (!args.length)
	{
		mixin FunctionPointer!(returnType, name, null, address);
	}
	else
	{
		enum _asm = wrapFunction(["ECX", "EDX"], returnType.stringof, name, args, address);
		debug pragma(msg, _asm ~ "\n");
		mixin(_asm);
	}
}

template ThiscallFunctionPointer(returnType, string name, FunctionArg[] args, size_t address)
{
	static if (!args.length)
	{
		mixin FunctionPointer!(returnType, name, null, address);
	}
	else
	{
		enum _asm = wrapFunction(["ECX"], returnType.stringof, name, args, address);
		debug pragma(msg, _asm ~ "\n");
		mixin(_asm);
	}
}

template VoidFunc(string name, size_t address)
{
	mixin _funcptr!("C", void, name, [], address);
}

//#define patchdecl(address,data) { (void*)address, arrayptrandsize(data) }
//#define ptrdecl(address,data) { (void*)address, (void*)data }
