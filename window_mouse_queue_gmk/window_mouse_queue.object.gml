#event create
surf = surface_create(room_width, room_height);
surface_set_target(surf);
draw_clear_alpha(c_white, 0);
surface_reset_target();
xlist = ds_list_create();
ylist = ds_list_create();
lastx = 0;
lasty = 0;
was_pressed = false;
window_mouse_queue_init();
room_speed = 10;

#event step



#event draw
draw_set_font(fnt_test);
draw_set_color(c_white);
if (mouse_check_button(mb_right)) {
    surface_set_target(surf);
    draw_clear_alpha(c_white, 0);
    surface_reset_target();
    //trace("clear");
}
var xn = window_mouse_get_x();
var yn = window_mouse_get_y();
//trace("last", lastx, lasty);
if (mouse_check_button(mb_left)) {
    ds_list_clear(xlist);
    ds_list_clear(ylist);
    var n = window_mouse_queue_get(xlist, ylist);
    
    surface_set_target(surf);
    for (var i = 0; i < n; i += 1) {
        var xp, yp;
        if (i == 0) {
            xp = lastx;
            yp = lasty;
        } else {
            xp = ds_list_find_value(xlist, i - 1);
            yp = ds_list_find_value(ylist, i - 1);
        }
        xn = ds_list_find_value(xlist, i);
        yn = ds_list_find_value(ylist, i);
        //trace(i, ":", xp, yp, "->", xn, yn);
        draw_arrow(xp, yp, xn, yn, 7);
        //draw_circle(xlist[|i], ylist[|i], 3, true);
    }
    draw_circle(mouse_x, mouse_y, 5, true);
    surface_reset_target();
    draw_text(5, 5, n);
    was_pressed = true;
} else {
    window_mouse_queue_clear();
    if (!was_pressed) {
        was_pressed = false;
        //trace("release");
    }
}
//trace("next", xn, yn);
lastx = xn;
lasty = yn;

draw_surface(surf, 0, 0);