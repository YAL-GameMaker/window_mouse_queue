/// @author YellowAfterlife

#include "stdafx.h"
#include <Windowsx.h>

struct mouse_point { int x, y; };
struct mouse_point_ex {
	int x, y, t;
};
yal_vector<mouse_point_ex> window_mouse_queue{};
POINT ptLast;
DWORD tmLast;
MOUSEMOVEPOINT mpList[64];

static WNDPROC wndProc_base = NULL;
static LRESULT wndProc_hook(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
	if (msg == WM_MOUSEMOVE) {
		//#define wmq_highres_points
		#ifndef wmq_highres_points
		const auto mode = GMMP_USE_DISPLAY_POINTS;
		#else
		int nVirtualWidth = GetSystemMetrics(SM_CXVIRTUALSCREEN);
		int nVirtualHeight = GetSystemMetrics(SM_CYVIRTUALSCREEN);
		int nVirtualLeft = GetSystemMetrics(SM_XVIRTUALSCREEN);
		int nVirtualTop = GetSystemMetrics(SM_YVIRTUALSCREEN);
		const auto mode = GMMP_USE_HIGH_RESOLUTION_POINTS;
		#endif

		POINT localPoint;
		localPoint.x = GET_X_LPARAM(lParam);
		localPoint.y = GET_Y_LPARAM(lParam);
		POINT screenPoint = localPoint;
		ClientToScreen(hwnd, &screenPoint);

		MOUSEMOVEPOINT mp_in;
		mp_in.x = screenPoint.x & 0x0000FFFF; // "Ensure that this number will pass through."?
		mp_in.y = screenPoint.y & 0x0000FFFF;
		mp_in.time = GetMessageTime();
		auto maxTime = mp_in.time;

		int found = GetMouseMovePointsEx(sizeof MOUSEMOVEPOINT, &mp_in, mpList, std::size(mpList), mode);
		//#define wmq_alt
		#ifdef wmq_alt
		int i = 0;
		// OSU approach https://github.com/ppy/osuTK/blob/master/src/osuTK/Platform/Windows/WinGLNative.cs
		// Somehow this works worse, or is position comparison wrong?
		for (; i < found; i += 1) {
			if (mpList[i].time < tmLast) break;
			if (mpList[i].time == tmLast
				&& mpList[i].x == mp_in.x
				&& mpList[i].y == mp_in.y
			) break;
		}
		#else
		int i = found;
		#endif
		while (--i >= 0)
		{
			auto& mp = mpList[i];
			#ifndef wmq_alt
			auto ok = mp.time > tmLast;
			//trace("tm_out %d: %d,%d t=%d lt=%d %d", i, mp.x, mp.y, mp.time, tmLast, ok);
			if (!ok) continue;
			//if (mp.time > maxTime) maxTime = mp.time;
			#endif // wmq_alt

			POINT pos;
			pos.x = mp.x;
			pos.y = mp.y;
			#ifndef wmq_highres_points
			if (pos.x >= 0x8000) pos.x -= 0x10000;
			if (pos.y >= 0x8000) pos.y -= 0x10000;
			#else
			pos.x = ((pos.x * (nVirtualWidth - 1)) - (nVirtualLeft * 65536)) / nVirtualWidth;
			pos.y = ((pos.y * (nVirtualHeight - 1)) - (nVirtualTop * 65536)) / nVirtualHeight;
			#endif
			ScreenToClient(hwnd, &pos);
			//
			mouse_point_ex p;
			p.x = pos.x;
			p.y = pos.y;
			p.t = mp.time;
			window_mouse_queue.push_back(p);
		}
		tmLast = maxTime; // mp_in.time;
		ptLast.x = mp_in.x;
		ptLast.y = mp_in.y;
	}
	return wndProc_base(hwnd, msg, wParam, lParam);
}

dllx double window_mouse_queue_init_raw(void* hwnd) {
	tmLast = 0;
	ptLast = {};
	window_mouse_queue.init(256);
	wndProc_base = (WNDPROC)SetWindowLongPtr((HWND)hwnd, GWLP_WNDPROC, (LONG_PTR)wndProc_hook);
	return 1;
}
/// #gmki
dllx double window_mouse_queue_init_raw_gmk(double hwnd) {
	return window_mouse_queue_init_raw((void*)(intptr_t)hwnd);
}
///
dllx double window_mouse_queue_get_count() {
	return window_mouse_queue.size();
}
dllx double window_mouse_queue_get_data(void* _dst, double _with_time) {
	auto has_time = _with_time > 0.5;
	auto src = window_mouse_queue.data();
	auto len = window_mouse_queue.size();
	if (_with_time > 0.5) {
		auto dst = (mouse_point_ex*)_dst;
		for (auto i = 0u; i < len; i++) {
			dst[i] = src[i];
		}
	} else {
		auto dst = (mouse_point*)_dst;
		for (auto i = 0u; i < len; i++) {
			dst[i] = *(mouse_point*)&src[i];
		}
	}
	window_mouse_queue.clear();
	return len;
}
dllx double window_mouse_queue_get_x(double ind) {
	auto i = (int)ind;
	return i >= 0 && i < (int)window_mouse_queue.size() ? window_mouse_queue[i].x : 0;
}
dllx double window_mouse_queue_get_y(double ind) {
	auto i = (int)ind;
	return i >= 0 && i < (int)window_mouse_queue.size() ? window_mouse_queue[i].y : 0;
}
dllx double window_mouse_queue_get_time(double ind) {
	auto i = (int)ind;
	return i >= 0 && i < (int)window_mouse_queue.size() ? window_mouse_queue[i].t : 0;
}
///
dllx double window_mouse_queue_clear() {
	window_mouse_queue.clear();
	return 1;
}