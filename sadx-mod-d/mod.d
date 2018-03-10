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
import std.math;
import std.stdio;

import ninja;
import functions;
import memaccess;
import variables;

MonoTime lastTime;

float squareroot(float a1)
{
	return (a1 >= 0.0) ? sqrt(a1) : -sqrt(a1 * -1.0f);
}

void DirectionToRotation_i(in NJS_VECTOR dir, out Angle x, out Angle y)
{
	x = cast(Angle)(atan2(dir.y, dir.z) * 65536.0f * -0.1591549762031479f);
	auto v3 = dir.z * dir.z + dir.y * dir.y;
	y = cast(Angle)(atan2(dir.x, squareroot(v3)) * 65536.0f * 0.1591549762031479f);
}

extern (C)
{
	export ModInfo SADXModInfo = { 4 };
	export void Init()
	{
		lastTime = MonoTime.currTime;

		// This disables ring count increment
		WriteData!(7)(cast(void*)0x00425C03, 0x90);
		PrintDebug("\t\t/!\\ D Mod Init /!\\\n");

		// Misc tests below.

		NJS_MATRIX matrix = [
			1.0f, 0.0f, 0.0f, 0.0f,
			0.0f, 1.0f, 0.0f, 0.0f,
			0.0f, 0.0f, 1.0f, 0.0f,
			0.0f, 0.0f, 0.0f, 1.0f
		];

		// This tests that thiscall functions are working.
		njRotateXYZ(matrix.ptr, 16384, 16384, 16384);
		stdout.writeln(matrix);

		Angle x, y;
		NJS_VECTOR dir = { x: 1000 - 500, y: 1000 - 100, z: 1000 - 50 };

		DirectionToRotation(&dir, &x, &y);
		PrintDebug("ORIG: %08X, %08X\n", x, y);
		DirectionToRotation_i(dir, x, y);
		PrintDebug("PORT: %08X, %08X\n", x, y);
	}

	export void OnFrame()
	{
		// Tests that usercall functions are working.
		int level = cast(int)CurrentLevel;
		int act = cast(int)CurrentAct;
		GetTimeOfDayLevelAndAct(&level, &act);

		auto now = MonoTime.currTime;
		auto dur = now - lastTime;
		lastTime = now;

		auto frameTime = cast(float)dur.total!"usecs";
		auto m = frameTime / (1_000_000.0f / 60.0f);

		// Fun framerate thing.
		PrintDebug("[D Mod] [%u] %2.3f FPS [%2.5f us]\n", cast(int)FrameCounter, 60.0f / m, frameTime);
	}
}
