#define STB_SPRINTF_IMPLEMENTATION
#include "stb/stb_sprintf.h"

#include <stdint.h>
#include <stdarg.h>
#include <stddef.h>

#include <stdio.h>
#include <string.h>
#include <time.h>
#include <base/base_context_cracking.h>

#if defined(OS_WIN32)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#endif

#include <base/base_core.h>
#include <base/base_string.h>
#include <os/os.h>
#if defined(OS_WIN32)
#include <os/os_win32.cpp>
#endif
#include <base/base_tcxt.h>
#include <cpu/platform.h>

#include <base/base_core.cpp>
#include <base/base_string.cpp>
#include <base/base_tcxt.cpp>

int main()
{
	printf("hiii\n");
}