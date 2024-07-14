@echo off

if not exist "window_mouse_queue-for-GMS1" mkdir "window_mouse_queue-for-GMS1\window_mouse_queue\Assets\datafiles"
cmd /C copyre ..\window_mouse_queue.gmx\extensions\window_mouse_queue.extension.gmx window_mouse_queue-for-GMS1\window_mouse_queue.extension.gmx
cmd /C copyre ..\window_mouse_queue.gmx\extensions\window_mouse_queue window_mouse_queue-for-GMS1\window_mouse_queue
cmd /C copyre ..\window_mouse_queue.gmx\datafiles\window_mouse_queue.html window_mouse_queue-for-GMS1\window_mouse_queue\Assets\datafiles\window_mouse_queue.html
cd window_mouse_queue-for-GMS1
cmd /C 7z a window_mouse_queue-for-GMS1.7z *
move /Y window_mouse_queue-for-GMS1.7z ../window_mouse_queue-for-GMS1.gmez
cd ..

if not exist "window_mouse_queue-for-GMS2\extensions" mkdir "window_mouse_queue-for-GMS2\extensions"
if not exist "window_mouse_queue-for-GMS2\datafiles" mkdir "window_mouse_queue-for-GMS2\datafiles"
if not exist "window_mouse_queue-for-GMS2\datafiles_yy" mkdir "window_mouse_queue-for-GMS2\datafiles_yy"
cmd /C copyre ..\window_mouse_queue_yy\extensions\window_mouse_queue window_mouse_queue-for-GMS2\extensions\window_mouse_queue
cmd /C copyre ..\window_mouse_queue_yy\datafiles\window_mouse_queue.html window_mouse_queue-for-GMS2\datafiles\window_mouse_queue.html
cmd /C copyre ..\window_mouse_queue_yy\datafiles_yy\window_mouse_queue.html.yy window_mouse_queue-for-GMS2\datafiles_yy\window_mouse_queue.html.yy
cd window_mouse_queue-for-GMS2
cmd /C 7z a window_mouse_queue-for-GMS2.zip *
move /Y window_mouse_queue-for-GMS2.zip ../window_mouse_queue-for-GMS2.yymp
cd ..

if not exist "window_mouse_queue-for-GMS2.3+\extensions" mkdir "window_mouse_queue-for-GMS2.3+\extensions"
if not exist "window_mouse_queue-for-GMS2.3+\datafiles" mkdir "window_mouse_queue-for-GMS2.3+\datafiles"
cmd /C copyre ..\window_mouse_queue_23\extensions\window_mouse_queue window_mouse_queue-for-GMS2.3+\extensions\window_mouse_queue
cmd /C copyre ..\window_mouse_queue_23\datafiles\window_mouse_queue.html window_mouse_queue-for-GMS2.3+\datafiles\window_mouse_queue.html
cd window_mouse_queue-for-GMS2.3+
cmd /C 7z a window_mouse_queue-for-GMS2.3+.zip *
move /Y window_mouse_queue-for-GMS2.3+.zip ../window_mouse_queue-for-GMS2.3+.yymps
cd ..

del /Q window_mouse_queue-demo-for-GMS2.3+.zip
cd ..\window_mouse_queue_demo_23
cmd /C 7z a ..\export\window_mouse_queue-demo-for-GMS2.3+.zip *

pause