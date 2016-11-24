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

import core.time;
import std.stdio;
import memaccess;
import vars;

mixin FunctionPointer!(void, "PrintDebug", [ MakeArg!(const char*)("Format"), MakeArg!(void)("...") ], 0x401000);

mixin FastcallFunctionPointer!(void, "njRotateXYZ", [
	MakeArg!(float*)("m"), MakeArg!(int)("angx"),
	MakeArg!(int)("angy"), MakeArg!(int)("angz")
], 0x781770);

MonoTime last_time;

extern (C)
{
	export ModInfo SADXModInfo = { 4 };
	export void Init()
	{
		last_time = MonoTime.currTime;

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
		auto now = MonoTime.currTime;
		auto dur = cast(TickDuration)(now - last_time);
		last_time = now;

		auto frameTime = to!("msecs", float)(dur);
		auto m = frameTime / (1000.0f / 60.0f);

		PrintDebug("[D Mod] [%u] %2.3f FPS [%2.5f ms]\n", cast(int)FrameCounter, 60.0f / m, frameTime);
	}
}
