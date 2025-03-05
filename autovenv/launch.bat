@echo off
setlocal
set PYTHON=venv\Scripts\python.exe
:run_webui
%PYTHON% run_webui.py %*
endlocal
echo keep this window open but press a key to exit.
pause >nul
exit /1