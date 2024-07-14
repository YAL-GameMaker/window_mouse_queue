set extname=window_mouse_queue
cmd /C del /Q "..\export\%extname%-for-GM81.zip"
cmd /C 7z a "..\export\%extname%-for-GM81.zip" %extname%.dll %extname%.gml %extname%.html