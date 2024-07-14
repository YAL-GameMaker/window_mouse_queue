@echo off
set /p ver="Version?: "
echo Uploading %ver%...
set user=yellowafterlife
set ext=gamemaker-window-mouse-queue
cmd /C itchio-butler push window_mouse_queue-for-GMS1.gmez %user%/%ext%:gms1 --userversion=%ver%
cmd /C itchio-butler push window_mouse_queue-for-GMS2.yymp %user%/%ext%:gms2 --userversion=%ver%
cmd /C itchio-butler push window_mouse_queue-for-GMS2.3+.yymps %user%/%ext%:gms2.3 --userversion=%ver%
cmd /C itchio-butler push window_mouse_queue-for-GM81.zip %user%/%ext%:gm8.1 --userversion=%ver%
cmd /C itchio-butler push window_mouse_queue-demo-for-GMS2.3+.zip %user%/%ext%:demo23 --userversion=%ver%

pause