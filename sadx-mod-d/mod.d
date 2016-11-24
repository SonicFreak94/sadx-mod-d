module mod;

struct ModInfo
{
	int Version;
	void* Init;
	const void *Patches;
	int PatchCount;
	const void *Jumps;
	int JumpCount;
	const void *Calls;
	int CallCount;
	const void *Pointers;
	int PointerCount;
}

import std.stdio;
import memaccess;
import vars;

mixin FunctionPointer!(void, "PrintDebug", [ MakeArg!(const char*)("Format"), MakeArg!(void)("...") ], 0x401000);
mixin FastcallFunctionPointer!(void,
							   "njRotateXYZ",
							   [ MakeArg!(float*)("m"), MakeArg!(int)("angx"), MakeArg!(int)("angy"), MakeArg!(int)("angz") ], 0x781770);

extern (C)
{
	export ModInfo SADXModInfo = { 4 };
	export void Init()
	{
		// This disables ring count increment
		WriteData(cast(void*)0x00425C03, cast(ubyte)0x90, 7);
		PrintDebug("\t\t/!\\ D Mod Init /!\\\n");

		float[4 * 4] matrix = [
			1.0f, 0.0f, 0.0f, 0.0f,
			0.0f, 1.0f, 0.0f, 0.0f,
			0.0f, 0.0f, 1.0f, 0.0f,
			0.0f, 0.0f, 0.0f, 1.0f
		];

		auto ptr = matrix.ptr;
		njRotateXYZ(ptr, 16384, 16384, 16384);
		stdout.writeln(matrix);
	}

	export void OnFrame()
	{
		// This should always print 0
		PrintDebug("D Mod Ring Count: %d\n", cast(short)Rings);
	}
}
