@echo off
set dllPath=%~1
set solutionDir=%~2
set projectDir=%~3
set arch=%~4
set config=%~5

goto bye

echo Running pre-build for %config%

where /q GmlCppExtFuncs
if %ERRORLEVEL% EQU 0 (
	echo Running GmlCppExtFuncs...
	GmlCppExtFuncs ^
	--prefix window_mouse_queue^
	--cpp "%projectDir%autogen.cpp"^
	--gml "%solutionDir%window_mouse_queue_23/extensions/window_mouse_queue/autogen.gml"^
	%projectDir%window_mouse_queue.cpp
)
:bye