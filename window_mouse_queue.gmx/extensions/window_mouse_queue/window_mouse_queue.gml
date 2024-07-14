#define window_mouse_queue_init
var _status;
/* GMS < 1:
window_mouse_queue_init_dll();
_status = external_call(global.f_window_mouse_queue_init_raw_gmk, window_handle());
/*/
_status = window_mouse_queue_init_raw(window_handle());
//*/
if (_status == 0) {
    show_debug_message("window_mouse_queue is not loaded");
}

#define window_mouse_queue_get
/// (xlist:ds_list<number>, ylist:ds_list<number>, ?timelist:ds_list<number>)->int
var _x_list = argument[0];
var _y_list = argument[1];
var _t_list; if (argument_count > 2) _t_list = argument[2]; else _t_list = -1;
var _len = window_mouse_queue_get_count();
if (_len == 0) return 0;

var _has_time = _t_list != -1;
// GMS >= 1:
var _size = _len;
if (_has_time) {
    _size *= 12;
} else _size *= 8;

gml_pragma("global", "global.__window_mouse_queue_buffer = undefined");
var _buf = global.__window_mouse_queue_buffer;
if (_buf == undefined) {
    _buf = buffer_create(_size, buffer_grow, 1);
    global.__window_mouse_queue_buffer = _buf;
} else if (buffer_get_size(_buf) < _size) {
    buffer_resize(_buf, _size);
}

window_mouse_queue_get_data(buffer_get_address(_buf), _has_time);
buffer_seek(_buf, buffer_seek_start, 0);
for (var i = 0; i < _len; i++) {
    ds_list_add(_x_list, buffer_read(_buf, buffer_s32));
    ds_list_add(_y_list, buffer_read(_buf, buffer_s32));
    if (_has_time) ds_list_add(_t_list, buffer_read(_buf, buffer_s32));
}
/*/
var i;
for (i = 0; i < _len; i += 1) {
    ds_list_add(_x_list, window_mouse_queue_get_x(i));
    ds_list_add(_y_list, window_mouse_queue_get_y(i));
    if (_has_time) ds_list_add(_t_list, window_mouse_queue_get_time(i));
}
window_mouse_queue_clear();
//*/
return _len;

/*#define window_mouse_queue_prepare_buffer
/// (size:int)->buffer~
#args _size
gml_pragma("global", "global.__window_mouse_queue_buffer = undefined");
var _buf = global.__window_mouse_queue_buffer;
if (_buf == undefined) {
    _buf = buffer_create(_size, buffer_grow, 1);
    global.__window_mouse_queue_buffer = _buf;
} else if (buffer_get_size(_buf) < _size) {
    buffer_resize(_buf, _size);
}
buffer_seek(_buf, buffer_seek_start, 0);
return _buf;*/