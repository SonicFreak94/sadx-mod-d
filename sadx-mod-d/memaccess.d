module memaccess;

import core.sys.windows.windows;
import std.algorithm;
import std.array;
import std.string;
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

// Argument for function pointers. See makeArg.
struct FunctionArg
{
	string type;
	size_t size;
	string register;
	string name;

	// Returns a string representation of the argument.
	// If the type is void, only the name is returned. Otherwise,
	// it returns the format: [type] [name].
	// Example: int myInt
	string toString()
	{
		return (type != void.stringof ? (type ~ " " ~ name) : name);
	}
}

/// Creates a `FunctionArg` of type `T`.
/// Example: `makeArg!int(myInt);`
auto makeArg(T = void)(const string name)
{
	FunctionArg result = {
		type: T.stringof,
		size: T.sizeof,
		name: name
	};

	return result;
}

/// Creates a `FunctionArg` of type `T` in register `register`
auto makeArg(T = void)(const string name, const string register)
{
	FunctionArg result = {
		type:     T.stringof,
		size:     T.sizeof,
		register: register,
		name:     name
	};

	return result;
}

auto userReturn(T)(const string register = null)
{
	FunctionArg result = {
		type:     T.stringof,
		size:     T.sizeof,
		register: register
	};
	
	return result;
}

/// Joins an array of arguments together, separated by comma.
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
pragma(inline, true)
auto LengthOfArray(T)(T[] t)
{
	return t.length;
}

/**
* Get the size of an array.
* @return Size of the array, in bytes.
*/
static auto SizeOfArray(T)(T[] t)
{
	return t.empty ? 0 : T.sizeof * t.length;
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

static HANDLE curproc;
static bool curprocinitialized = false;

pragma(inline, true)
BOOL WriteData(void* writeaddress, const void* data, SIZE_T datasize, SIZE_T* byteswritten)
{
	if (!curprocinitialized)
	{
		curproc = GetCurrentProcess();
		curprocinitialized = true;
	}

	return WriteProcessMemory(curproc, writeaddress, data, datasize, byteswritten);
}

pragma(inline, true)
static BOOL WriteData(void* writeaddress, const void* data, SIZE_T datasize)
{
	return WriteData(writeaddress, data, datasize, null);
}

pragma(inline, true)
static BOOL WriteData(T)(const T* writeaddress, const T data, SIZE_T* byteswritten)
{
	return WriteData(cast(void*)writeaddress, cast(void*)&data, cast(SIZE_T)T.sizeof, byteswritten);
}

pragma(inline, true)
static BOOL WriteData(T)(const T* writeaddress, const T data)
{
	return WriteData(writeaddress, data, null);
}

pragma(inline, true)
static BOOL WriteData(T)(T* writeaddress, in T data, SIZE_T* byteswritten)
{
	return WriteData(writeaddress, &data, sizeof(data), byteswritten);
}

pragma(inline, true)
static BOOL WriteData(T)(T* writeaddress, in T data)
{
	return WriteData(writeaddress, data, null);
}

pragma(inline, true)
static BOOL WriteData(T)(void* writeaddress, const T[] data, SIZE_T* byteswritten)
{
	return WriteData(writeaddress, data.ptr, SizeOfArray(data), byteswritten);
}

pragma(inline, true)
static BOOL WriteData(T)(void* writeaddress, const T[] data)
{
	return WriteData(writeaddress, data, null);
}

/**
* Write a repeated byte to an arbitrary address.
* @param address	[in] Address.
* @param data		[in] Byte to write.
* @param byteswritten	[out, opt] Number of bytes written.
* @return Nonzero on success; 0 on error (check GetLastError()).
*/
pragma(inline, true)
static BOOL WriteData(int count)(void* address, const char data, SIZE_T* byteswritten)
{
	char[count] buf;
	buf[] = data;
	int result = WriteData(address, buf.ptr, buf.length, byteswritten);
	return result;
}

/**
* Write a repeated byte to an arbitrary address.
* @param address	[in] Address.
* @param data		[in] Byte to write.
* @return Nonzero on success; 0 on error (check GetLastError()).
*/
pragma(inline, true)
static BOOL WriteData(int count)(void* address, char data)
{
	return WriteData!(count)(address, data, null);
}

version (X86)
{
	/**
	* Write a JMP instruction to an arbitrary address.
	* @param writeaddress Address to insert the JMP instruction.
	* @param funcaddress Address to JMP to.
	* @return Nonzero on success; 0 on error (check GetLastError()).
	*/
	pragma(inline, true)
	static BOOL WriteJump(void* writeaddress, void* funcaddress)
	{
		ubyte[5] data;
		data[0] = 0xE9; // JMP DWORD (relative)
		*cast(uint*)(data.ptr + 1) = cast(uint)funcaddress - (cast(uint)writeaddress + 5);
		return WriteData(writeaddress, data);
	}

	/**
	* Write a CALL instruction to an arbitrary address.
	* @param writeaddress Address to insert the CALL instruction.
	* @param funcaddress Address to CALL.
	* @return Nonzero on success; 0 on error (check GetLastError()).
	*/
	pragma(inline, true)
	static BOOL WriteCall(void* writeaddress, void* funcaddress)
	{
		ubyte[5] data;
		data[0] = 0xE8; // CALL DWORD (relative)
		*cast(uint*)(data.ptr + 1) = cast(uint)funcaddress - (cast(uint)writeaddress + 5);
		return WriteData(writeaddress, data);
	}
}

// Data pointer and array declarations.

template DataPointer(type, string name, size_t address)
{
	import std.format : format;

	mixin(format!("auto %2$s = Reference!(%1$s)(cast(%1$s*)0x%3$08X);")
				 (type.stringof, name, address));
}

template DataArray(type, string name, size_t address, size_t length)
{
	import std.format : format;

	mixin(format!("const auto %2$s = cast(%1$s*)%3$s; const auto %2$s_Length = %4$s;")
				 (type.stringof, name, address, length));
}

// Function pointer declarations.

template _funcptr(string type, returnType, string name, FunctionArg[] args, size_t address)
{
	import std.string;
	import std.algorithm;
	import std.array;

	enum result = format!("extern (%5$s) const auto %2$s = cast(%1$s function(%3$s))0x%4$08X;")
						 (returnType.stringof, name, args.toString(), address, type);

	//debug pragma(msg, result ~ "\n");
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

enum PurgeType
{
	// Calling function cleans up the stack. (__cdecl)
	Caller,
	// Called function cleans up the stack. (__stdcall)
	Callee
}

string wrapFunction(PurgeType purgeType, FunctionArg returnType, string name, FunctionArg[] args, size_t address, string[] registers = null)
{
	Appender!(string) str;

	// Address declaration. Example:
	// const auto name_ptr = cast(void*)0x12345678;
	str.put(format!("const auto %s_ptr = cast(void*)0x%08X;")(name, address));

	// Function declaration. Example:
	// type name(args, args, args)
	// {
	str.put(format!("\n%s %s(%s)\n{")
				   (returnType.type, name, args.toString()));

	// Local copy of address. Example:
	// auto func_ptr = cast(uint)name_ptr;
	str.put("\n\tauto func_ptr = cast(uint)" ~ name ~ "_ptr;");

	// If the function has a return value, we should store it
	// and return it from this wrapper function later.
	bool has_return = !returnType.type.empty && returnType.type != void.stringof;

	if (has_return)
	{
		// Return value. Example:
		// type result;
		str.put("\n\t" ~ returnType.type ~ " result;");
	}

	// asm
	// {
	str.put("\n\tasm\n\t{");

	// Add provided registers to first n args.
	if (registers.length)
	{
		auto count = min(registers.length, args.length);
		for (size_t i = 0; i < count; i++)
		{
			args[i].register = registers[i];
		}
	}

	// Sort by register. Just a stylistic thing, really.
	args.sort!((a, b) => !a.register.empty && b.register.empty);
	size_t stackTemp = 0;

	foreach (arg; args)
	{
		str.put("\n\t\t");

		if (arg.register.empty)
		{
			if (arg.name.empty)
			{
				import std.conv : to;
				arg.name = "_ESP" ~ to!string(stackTemp);
				stackTemp += 4;
			}

			str.put("push " ~ arg.name ~ ";");
		}
		else
		{
			if (arg.name.empty)
			{
				arg.name = "_" ~ arg.register;
			}

			string register = arg.register;

			if (arg.size < 4)
			{
				str.put(format!("xor %1$s, %1$s;")(register));
				str.put("\n\t\t");

				if (arg.size == 1)
				{
					register = ` ` ~ register[1] ~ `L`;
				}
				else if (arg.size == 2)
				{
					register = ` ` ~ register[1] ~ `X`;
				}
				else
				{
					assert(false, "size of " ~ arg.type ~ " is invalid!");
				}
			}

			// Examples:
			// mov ECX, myCoolArg;
			// mov  CX, myCoolArg;
			// mov  CL, myCoolArg;
			str.put(format!("mov %s, %s;")(register, arg.name));
		}
	}

	// Call the real function.
	str.put("\n\t\tcall far ptr [func_ptr];");

	if (has_return)
	{
		// Move the return value into our local variable.
		//		mov result, eax
		str.put("\n\t\tmov result, " ~ returnType.register ~ ';');
	}

	if (purgeType == PurgeType.Caller)
	{
		auto stackOffset = args
			.filter!((x) => x.register.empty)
			.map!((x) => max(4, x.size)) // four-byte aligned
			.sum;

		if (stackOffset > 0)
		{
			str.put(format!("\n\t\tadd ESP, 0x%02X;")(stackOffset));
		}
	}

	//	} (end of asm block)
	str.put("\n\t}");

	if (has_return)
	{
		//	return result;
		str.put("\n\treturn result;");
	}

	// } (end of function)
	str.put("\n}");

	return str.data;
}

template FastcallFunctionPointer(returnType, string name, FunctionArg[] args, size_t address)
	if (args.length > 0 && args.all!(x => !x.register.length))
{
	enum _asm = wrapFunction(PurgeType.Callee, userReturn!returnType("EAX"), name, args, address, ["ECX", "EDX"]);
	mixin(_asm);
}

template ThiscallFunctionPointer(returnType, string name, FunctionArg[] args, size_t address)
	if (args.length > 0 && args.all!(x => !x.register.length))
{
	enum _asm = wrapFunction(PurgeType.Callee, userReturn!returnType("EAX"), name, args, address, ["ECX"]);
	mixin(_asm);
}

template VoidFunc(string name, size_t address)
{
	mixin _funcptr!("C", void, name, null, address);
}


template UserFunctionPointer(PurgeType purgeType, FunctionArg returnType, string name, FunctionArg[] args, size_t address)
	if ((returnType.type == void.stringof || returnType.register.length > 0) && args.any!(x => x.register.length > 0))
{
	enum _asm = wrapFunction(purgeType, returnType, name, args, address);
	mixin(_asm);
}

template UsercallFunctionPointer(FunctionArg returnType, string name, FunctionArg[] args, size_t address)
{
	mixin UserFunctionPointer!(PurgeType.Callee, returnType, name, args, address);
}

template UserpurgeFunctionPointer(FunctionArg returnType, string name, FunctionArg[] args, size_t address)
{
	mixin UserFunctionPointer!(PurgeType.Caller, returnType, name, args, address);
}

//#define patchdecl(address,data) { (void*)address, arrayptrandsize(data) }
//#define ptrdecl(address,data) { (void*)address, (void*)data }
