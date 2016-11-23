module dllmain;

import core.sys.windows.windows;
import core.sys.windows.dll;

__gshared HINSTANCE g_hInst;

extern (Windows)
BOOL DllMain(HINSTANCE hInstance, ULONG ulReason, LPVOID pvReserved)
{
	switch (ulReason)
	{
		case DLL_PROCESS_ATTACH:
			g_hInst = hInstance;
			dll_process_attach(hInstance, true);
			break;

		case DLL_PROCESS_DETACH:
			dll_process_detach(hInstance, true);
			break;

		case DLL_THREAD_ATTACH:
			dll_thread_attach(true, true);
			break;

		case DLL_THREAD_DETACH:
			dll_thread_detach(true, true);
			break;

		default:
			break;
	}
	return true;
}

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
import vars;

extern (C)
{
	export ModInfo SADXModInfo = { 4 };
	export void Init()
	{
		stdout.writeln("D Mod Init");
	}

	export void OnFrame()
	{
		stdout.writeln("D Mod Ring Count: ", cast(short)Rings);
	}
}
