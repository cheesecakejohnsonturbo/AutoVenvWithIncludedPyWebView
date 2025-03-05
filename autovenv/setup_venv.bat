@echo off
SETLOCAL

set "venv_path=%~dp0\venv\Scripts"
set "activate_script=%venv_path%\activate.bat"
set "deactivate_script=%venv_path%\deactivate.bat"
set "venv_python=%venv_path%\python.exe"

:: Check if venv path exists
if not exist "%venv_path%" (
    echo Venv path missing.
    echo Press any key to proceed with venv installation, or close this window to abort.
    pause >nul

    echo Creating virtual environment...
    "%USERPROFILE%\AppData\Local\Programs\Python\Python312\python.exe" -m venv venv
    if errorlevel 1 goto :venv_install_error
    echo Virtual environment created successfully.
)

:: Activate virtual environment
if not exist "%activate_script%" (
    echo ERROR: Activate script not found at "%activate_script%". Venv installation may be incomplete.
    pause
    goto :error_exit
)
call "%activate_script%"
if errorlevel 1 goto :venv_activate_error
echo Virtual environment activated.

:: Check Python in venv
echo Checking Python in VENV...
if not exist "%venv_python%" (
    echo ERROR: Python executable not found in venv at "%venv_python%". Venv installation may be incomplete.
    pause
    goto :error_exit
)
"%venv_python%" -c "print('Python in venv is working')"
if errorlevel 1 goto :venv_python_check_error
echo Python check successful.

echo Python version in VENV:
"%venv_python%" --version
if errorlevel 1 goto :venv_python_version_error

:: Deactivate virtual environment
if exist "%deactivate_script%" (
    call "%deactivate_script%"
    echo Virtual environment deactivated.
) else (
    echo WARNING: Deactivate script not found at "%deactivate_script%".  Deactivation skipped.
)


echo.
echo Script completed successfully.
pause
goto :success_exit


:venv_install_error
echo ERROR: Failed to create virtual environment. Check Python 3.12 installation and permissions.
pause
goto :error_exit

:venv_activate_error
echo ERROR: Failed to activate virtual environment. Check "%activate_script%" exists and permissions.
pause
goto :error_exit

:venv_python_check_error
echo ERROR: Failed to run python in venv. Venv may be corrupted.
pause
goto :error_exit

:venv_python_version_error
echo ERROR: Failed to get python version from venv. Venv may be corrupted.
pause
goto :error_exit


:error_exit
echo Script failed with errors.
exit /b 1

:success_exit
exit /b 0

:ENDLOCAL
ENDLOCAL