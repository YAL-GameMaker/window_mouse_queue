# window_mouse_queue

**Quick links:** [itch.io](https://yellowafterlife.itch.io/gamemaker-window-mouse-queue)
· [documentation](https://yal.cc/docs/gm/window_mouse_queue/)

![](paint.gif)

This is a wrapper for `GetMouseMovePointsEx` function that allows to extract high-precision mouse/pointer motion data on Windows. Good for drawing software!

## Known issues

On certain machines the coordinates are occasionally reported out of order,
or even with out-of-line points.

Most likely an issue with WinAPI function itself, but feel free to debug it if it happens for you.

In the meantime, it is best to offer an option to disable the behaviour
so that owners of cursed computers can still use your application
(even if with lower precision).

## Meta

**Author:** [YellowAfterlife](https://github.com/YellowAfterlife)  
**License:** MIT