// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#ifdef _WINDOWS
	#include "targetver.h"
	
	#define WIN32_LEAN_AND_MEAN // Exclude rarely-used stuff from Windows headers
	#include <windows.h>
#endif

#if defined(WIN32)
#define dllx extern "C" __declspec(dllexport)
#elif defined(GNUC)
#define dllx extern "C" __attribute__ ((visibility("default"))) 
#else
#define dllx extern "C"
#endif

#define _trace // requires user32.lib;Kernel32.lib

#ifdef _trace
#ifdef _WINDOWS
void trace(const char* format, ...);
#else
#define trace(...) { printf("[window_mouse_queue:%d] ", __LINE__); printf(__VA_ARGS__); printf("\n"); fflush(stdout); }
#endif
#endif

#include "gml_ext.h"

// TODO: reference additional headers your program requires here

void yal_memset(void* at, int fill, size_t len);

void* yal_alloc(size_t bytes);
template<typename T> T* yal_alloc_arr(size_t count = 1) {
	return (T*)yal_alloc(sizeof(T) * count);
}
void* yal_realloc(void* thing, size_t bytes);
template<typename T> T* yal_realloc_arr(T* arr, size_t count) {
	return (T*)yal_realloc(arr, sizeof(T) * count);
}
bool yal_free(void* thing);

template<typename T> class yal_vector {
private:
	T* arr = nullptr;
	size_t len = 0;
	size_t capacity = 0;
public:
	yal_vector() {
		//
	}
	void init(size_t _capacity = 4) {
		arr = yal_alloc_arr<T>(_capacity);
		capacity = _capacity;
		len = 0;
	}
	void clear() {
		len = 0;
	}
	T* data() {
		return arr;
	}
	size_t size() {
		return len;
	}
	void push_back(T val) {
		if (len >= capacity) {
			capacity *= 2;
			arr = yal_realloc_arr(arr, capacity);
		}
		arr[len++] = val;
	}
	T operator[](size_t index) {
		return arr[index];
	}
};