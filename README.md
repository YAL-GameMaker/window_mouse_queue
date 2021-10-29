# window_mouse_queue

![](paint.gif)

This is a wrapper for `GetMouseMovePointsEx` function that allows to extract high-precision mouse/pointer motion data on Windows. Good for drawing software!

## Functions

- **window_mouse_queue_init()**  
  Call on game start!
- **window_mouse_queue_get(xlist, ylist)**  
  Adds new coordinates since the last call to the two provided `ds_list`s.  
  Returns the number of items added.  
  Note that this does not clear the lists prior!
- **window_mouse_queue_clear()**  
  Discards the accumulated coordinates without returning them.  
  If you aren't going to do anything with coordinates for this frame, you should call this function to avoid coordinate build-up.

## Meta

**Author:** [YellowAfterlife](https://github.com/YellowAfterlife)  
**License:** MIT