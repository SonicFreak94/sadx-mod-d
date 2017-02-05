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

import memaccess;
import ninja;
import vars;

mixin FunctionPointer!(void, "PrintDebug", [ MakeArg!(const char*)("Format"), MakeArg("...") ], 0x401000);

mixin FastcallFunctionPointer!(void, "njRotateXYZ", [
	MakeArg!(float*)("m"), MakeArg!int("angx"),
	MakeArg!int("angy"), MakeArg!int("angz")
], 0x781770);

mixin UsercallFunctionPointer!(UserReturn!void, "TimeOfDayId", [
	MakeArg!(int*)("act", "EDI"), MakeArg!(int*)("level", "EBX")
], 0x0040A420);

mixin FunctionPointer!(void, "DirectionToRotation", [ MakeArg!(const NJS_VECTOR*)("dir"), MakeArg!(Angle*)("x"), MakeArg!(Angle*)("y") ], 0x004BCCA0);

MonoTime last_time;

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
		last_time = MonoTime.currTime;

		// This disables ring count increment
		WriteData(cast(void*)0x00425C03, cast(ubyte)0x90, 7);
		PrintDebug("\t\t/!\\ D Mod Init /!\\\n");

		NJS_MATRIX matrix = [
			1.0f, 0.0f, 0.0f, 0.0f,
			0.0f, 1.0f, 0.0f, 0.0f,
			0.0f, 0.0f, 1.0f, 0.0f,
			0.0f, 0.0f, 0.0f, 1.0f
		];

		njRotateXYZ(matrix.ptr, 16384, 16384, 16384);
		stdout.writeln(matrix);

		NJS_VECTOR dir = { x: 1000 - 500, y: 1000 - 100, z: 1000 - 50 };
		Angle x, y;
		DirectionToRotation(&dir, &x, &y);
		PrintDebug("ORIG: %08X, %08X\n", x, y);
		DirectionToRotation_i(dir, x, y);
		PrintDebug("PORT: %08X, %08X\n", x, y);
	}

	export void OnFrame()
	{
		int level = cast(int)CurrentLevel;
		int act = cast(int)CurrentAct;
		TimeOfDayId(&level, &act);

		auto now = MonoTime.currTime;
		auto dur = cast(TickDuration)(now - last_time);
		last_time = now;

		auto frameTime = to!("msecs", float)(dur);
		auto m = frameTime / (1000.0f / 60.0f);

		PrintDebug("[D Mod] [%u] %2.3f FPS [%2.5f ms]\n", cast(int)FrameCounter, 60.0f / m, frameTime);
	}
}
