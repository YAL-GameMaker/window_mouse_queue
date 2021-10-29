draw_set_font(fnt_test);
draw_set_color(c_white);
if (mouse_check_button(mb_right)) {
    surface_set_target(surf);
    draw_clear_alpha(c_white, 0);
    surface_reset_target();
}
if (mouse_check_button(mb_left)) {
    ds_list_clear(xlist);
    ds_list_clear(ylist);
    var n = window_mouse_queue_get(xlist, ylist);
    
    surface_set_target(surf);
    for (var i = 0; i < n; i++) {
        //trace(i, xlist[|i], ylist[|i]);
        var xp, yp;
        if (i == 0) {
            xp = lastx;
            yp = lasty;
        } else {
            xp = xlist[|i - 1];
            yp = ylist[|i - 1];
        }
        draw_arrow(xp, yp, xlist[|i], ylist[|i], 7);
        //draw_circle(xlist[|i], ylist[|i], 3, true);
    }
    draw_circle(mouse_x, mouse_y, 5, true);
    surface_reset_target();
    draw_text(5, 5, n);
} else window_mouse_queue_clear();
lastx = window_mouse_get_x();
lasty = window_mouse_get_y();

draw_surface(surf, 0, 0);