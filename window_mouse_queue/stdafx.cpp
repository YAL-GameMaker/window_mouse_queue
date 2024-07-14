// stdafx.cpp : source file that includes just the standard includes
// window_mouse_queue.pch will be the pre-compiled header
// stdafx.obj will contain the pre-compiled type information

#include "stdafx.h"
#include <strsafe.h>
#ifdef tiny_dtoui3
#include <intrin.h>
#endif

#if _WINDOWS
// http://computer-programming-forum.com/7-vc.net/07649664cea3e3d7.htm
extern "C" int _fltused = 0;
#endif

// TODO: reference any additional headers you need in STDAFX.H
// and not in this file
#ifdef _trace
#ifdef _WINDOWS
// https://yal.cc/printf-without-standard-library/
void trace(const char* pszFormat, ...) {
	char buf[1025];
	va_list argList;
	va_start(argList, pszFormat);
	wvsprintfA(buf, pszFormat, argList);
	va_end(argList);
	DWORD done;
	auto len = strlen(buf);
	buf[len] = '\n';
	buf[++len] = 0;
	WriteFile(GetStdHandle(STD_OUTPUT_HANDLE), buf, len, &done, NULL);
}
#endif
#endif

void yal_memset(void* at, int fill, size_t len) {
	auto ptr = (uint8_t*)at;
	while (len != 0) {
		*ptr++ = (uint8_t)fill;
		len = (len - 1) & 0x7FFFFFFFu; // can't be just len-- or compiler will optimize this to a std memset
	}
}

void* yal_alloc(size_t bytes) {
	return HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, bytes);
}
void* yal_realloc(void* thing, size_t bytes) {
	return HeapReAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, thing, bytes);
}
bool yal_free(void* thing) {
	return HeapFree(GetProcessHeap(), 0, thing);
}
