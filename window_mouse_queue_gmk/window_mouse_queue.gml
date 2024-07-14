#define window_mouse_queue_init_dll
/// window_mouse_queue_init_dll(?path_prefix)
var _path, _dir;
if (argument_count > 0) {
    _dir = argument[0];
} else _dir = "";

_path = _dir + "window_mouse_queue.dll";
global.f_window_mouse_queue_init_raw = external_define(_path, "window_mouse_queue_init_raw", dll_cdecl, ty_real, 1, ty_string);
global.f_window_mouse_queue_get_count = external_define(_path, "window_mouse_queue_get_count", dll_cdecl, ty_real, 0);
global.f_window_mouse_queue_get_data = external_define(_path, "window_mouse_queue_get_data", dll_cdecl, ty_real, 2, ty_string, ty_real);
global.f_window_mouse_queue_get_x = external_define(_path, "window_mouse_queue_get_x", dll_cdecl, ty_real, 1, ty_real);
global.f_window_mouse_queue_get_y = external_define(_path, "window_mouse_queue_get_y", dll_cdecl, ty_real, 1, ty_real);
global.f_window_mouse_queue_get_time = external_define(_path, "window_mouse_queue_get_time", dll_cdecl, ty_real, 1, ty_real);
global.f_window_mouse_queue_clear = external_define(_path, "window_mouse_queue_clear", dll_cdecl, ty_real, 0);
global.f_window_mouse_queue_init_raw_gmk = external_define(_path, "window_mouse_queue_init_raw_gmk", dll_cdecl, ty_real, 1, ty_real);

#define window_mouse_queue_init
var _status;
window_mouse_queue_init_dll();
_status = external_call(global.f_window_mouse_queue_init_raw_gmk, window_handle());
if (_status == 0) {
    show_debug_message("window_mouse_queue is not loaded");
}

#define window_mouse_queue_get
/// (xlist:ds_list<number>, ylist:ds_list<number>, ?timelist:ds_list<number>)->int
var _x_list; _x_list = argument[0];
var _y_list; _y_list = argument[1];
var _t_list; if (argument_count > 2) _t_list = argument[2]; else _t_list = -1;
var _len; _len = window_mouse_queue_get_count();
if (_len == 0) return 0;

var _has_time; _has_time = _t_list != -1;
var i;
for (i = 0; i < _len; i += 1) {
    ds_list_add(_x_list, window_mouse_queue_get_x(i));
    ds_list_add(_y_list, window_mouse_queue_get_y(i));
    if (_has_time) ds_list_add(_t_list, window_mouse_queue_get_time(i));
}
window_mouse_queue_clear();
return _len;

/*#define window_mouse_queue_prepare_buffer
/// (size:int)->buffer~
#args _size
gml_pragma("global", "global.__window_mouse_queue_buffer = undefined");
var _buf; _buf = global.__window_mouse_queue_buffer;
if (_buf == undefined) {
    _buf = buffer_create(_size, buffer_grow, 1);
    global.__window_mouse_queue_buffer = _buf;
} else if (buffer_get_size(_buf) < _size) {
    buffer_resize(_buf, _size);
}
buffer_seek(_buf, buffer_seek_start, 0);
return _buf;*/
#define window_mouse_queue_get_count
/// window_mouse_queue_get_count()
return external_call(global.f_window_mouse_queue_get_count);

#define window_mouse_queue_get_data
return external_call(global.f_window_mouse_queue_get_data, argument0, argument1);

#define window_mouse_queue_get_x
return external_call(global.f_window_mouse_queue_get_x, argument0);

#define window_mouse_queue_get_y
return external_call(global.f_window_mouse_queue_get_y, argument0);

#define window_mouse_queue_get_time
return external_call(global.f_window_mouse_queue_get_time, argument0);

#define window_mouse_queue_clear
/// window_mouse_queue_clear()
return external_call(global.f_window_mouse_queue_clear);
