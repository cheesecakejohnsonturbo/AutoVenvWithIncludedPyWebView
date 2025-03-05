@echo off
setlocal
:menu
cls
echo.
echo Main Menu
echo.
echo 1. Run localVENV.bat (Setup and Test Virtual Environment)
echo 2. Run local_python.bat (Interactive Python Shell)
echo 3. Exit
echo.

choice /c 123 /m "Choose an option: "

if errorlevel 3 goto :exit_script
if errorlevel 2 goto :run_local_python
if errorlevel 1 goto :run_local_venv

:run_local_venv
call localVENV.bat
goto :menu

:run_local_python
call local_python.bat
goto :menu

:exit_script
endlocal
exit /b 0