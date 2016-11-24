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

mixin FunctionPointer!(void, "PrintDebug", "(const char* Format, ...)", 0x401000);

extern (C)
{
	export ModInfo SADXModInfo = { 4 };
	export void Init()
	{
		PrintDebug("D Mod Init\n");
		// This disables ring count increment
		WriteData(cast(void*)0x00425C03, cast(ubyte)0x90, 7);
	}

	export void OnFrame()
	{
		// This should always print 0
		PrintDebug("D Mod Ring Count: %d\n", cast(short)Rings);
	}
}
