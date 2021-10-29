/// @author YellowAfterlife

#include "stdafx.h"
#include <Windowsx.h>

struct mouse_point {
	int x;
	int y;
};
yal_vector<mouse_point> window_mouse_queue{};
POINT ptLast;
DWORD tmLast;

static WNDPROC wndProc_base = NULL;
static LRESULT wndProc_hook(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
	if (msg == WM_MOUSEMOVE) {
		int nVirtualWidth = GetSystemMetrics(SM_CXVIRTUALSCREEN);
		int nVirtualHeight = GetSystemMetrics(SM_CYVIRTUALSCREEN);
		int nVirtualLeft = GetSystemMetrics(SM_XVIRTUALSCREEN);
		int nVirtualTop = GetSystemMetrics(SM_YVIRTUALSCREEN);
		int mode = GMMP_USE_DISPLAY_POINTS;

		POINT localPoint;
		localPoint.x = GET_X_LPARAM(lParam);
		localPoint.y = GET_Y_LPARAM(lParam);
		POINT screenPoint = localPoint;
		ClientToScreen(hwnd, &screenPoint);

		MOUSEMOVEPOINT mp_in;
		mp_in.x = screenPoint.x & 0x0000FFFF; // "Ensure that this number will pass through."?
		mp_in.y = screenPoint.y & 0x0000FFFF;
		mp_in.time = GetMessageTime();

		MOUSEMOVEPOINT mp_out[64];
		//yal_memset(mp_out, 0, sizeof mp_out);

		int cpt = GetMouseMovePointsEx(sizeof MOUSEMOVEPOINT, &mp_in, mp_out, 64, mode);
		for (int i = cpt - 1; i >= 0; i--) {
			auto& mp = mp_out[i];
			auto ok = mp.time >= tmLast;
			//trace("tm_out %d: %d,%d t=%d lt=%d %d", i, mp.x, mp.y, mp.time, tmLast, ok);
			if (!ok) continue;
			if (mode == GMMP_USE_DISPLAY_POINTS) {
				if (mp.x >= 0x8000) mp.x -= 0x10000;
				if (mp.y >= 0x8000) mp.y -= 0x10000;
			} else if (mode == GMMP_USE_HIGH_RESOLUTION_POINTS) {
				mp.x = ((mp.x * (nVirtualWidth - 1)) - (nVirtualLeft * 65536)) / nVirtualWidth;
				mp.y = ((mp.y * (nVirtualHeight - 1)) - (nVirtualTop * 65536)) / nVirtualHeight;
			}
			//
			mouse_point p;
			p.x = mp.x;
			p.y = mp.y;
			window_mouse_queue.push_back(p);
		}
		tmLast = mp_in.time;
		ptLast.x = mp_in.x;
		ptLast.y = mp_in.y;
	}
	return wndProc_base(hwnd, msg, wParam, lParam);
}

dllx double window_mouse_queue_init_raw(void* hwnd) {
	tmLast = 0;
	ptLast = {};
	window_mouse_queue.init(16);
	wndProc_base = (WNDPROC)SetWindowLongPtr((HWND)hwnd, GWLP_WNDPROC, (LONG_PTR)wndProc_hook);
	return 1;
}
dllx double window_mouse_queue_get_1() {
	return window_mouse_queue.size();
}
dllx double window_mouse_queue_get_2(mouse_point* dst) {
	auto src = window_mouse_queue.data();
	auto len = window_mouse_queue.size();
	for (auto i = 0u; i < len; i++) {
		dst[i] = src[i];
	}
	window_mouse_queue.clear();
	return len;
}
///
dllx double window_mouse_queue_clear() {
	window_mouse_queue.clear();
	return 1;
}