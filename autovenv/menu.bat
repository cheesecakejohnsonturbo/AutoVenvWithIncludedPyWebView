@echo off
setlocal
set PYTHON=venv\Scripts\python.exe

::Main features catalogue
:menu_index
cls
echo Main Menu
echo -----------------
echo 1. Quick Launch PyWebViewViewport
echo 2. Go to Setup
echo 3. Go to Python menu
echo 4. Go to PyWebView menu
echo 5. Quit
choice /c 12345 /m "Choose an option: "
if errorlevel 5 goto :successful_exit
if errorlevel 4 goto :webview_menu
if errorlevel 3 goto :python_menu
if errorlevel 2 goto :setup_menu
if errorlevel 1 goto :run_webui_viewport

::Webview git features catalogue
:webview_menu
cls
echo PyWebView Menu
echo -----------------
echo 1. Git Clone PyWebView repository (only to review its code)
echo 2. Return

choice /c 12 /m "Choose an option: "
if errorlevel 2 goto :menu_index
if errorlevel 1 goto :run_pywebview_git_clone

::Python features catalogue
:python_menu
cls
echo Python Menu
echo -----------------
echo 1. Run arbitrary python commands (careful)
echo 2. Show python version
echo 3. Upgrade PIP
echo 4. Install requirements.txt file (locally)
echo 5. Return
choice /c 12345 /m "Choose an option: "
if errorlevel 5 goto :menu_index
if errorlevel 4 goto :run_install_requirements
if errorlevel 3 goto :python_upgrade_pip
if errorlevel 2 goto :python_version
if errorlevel 1 goto :local_python

::Setup index
:setup_menu
cls
echo PyWebView Menu
echo ------------------
echo 1. Install VENV
echo 2. PIP Install PywebView (Necessary to have a local viewport)
echo 3. View Readme.md (current project)
echo 4. View License (Also current project)
echo 5. Exit
choice /c 12345 /m "Choose an option: "
if errorlevel 5 goto :menu_index
if errorlevel 4 goto :view_license
if errorlevel 3 goto :view_readme_md
if errorlevel 2 goto :pip_install_webview
if errorlevel 1 goto :setup_venv
::Dictionary of functions below
::To clone (optional) the pywebview git
:run_pywebview_git_clone
call pywebview_git_clone.bat
goto :menu_index
::Run viewport on custom run_webui.py
:run_webui_viewport
%PYTHON% run_webui.py %*
echo Keep this window open, but press a key to exit.
pause >nul
goto :menu_index
::Not implemented::License viewer
:view_readme_md
::%PYTHON% run_readme.py %*
::echo Keep this window open, but press a key to exit.
echo Not implemented yet
pause >nul
goto :menu_index
::Not Implemented::Readme.md viewer
:view_license
::%PYTHON% run_license.py %*
::echo Keep this window open, but press a key to exit.
echo Not implemented yet
pause >nul
goto :menu_index
::Python utilities::
::Important
:setup_venv
call setup_venv.bat
goto :menu_index
::Install requirements
:run_install_requirements
%PYTHON% -m pip install -r requirements.txt %*
echo Processed. Press a key to return or exit.
pause >nul
goto :menu_index
::upgrade pip
:python_upgrade_pip
%PYTHON% -m pip install --upgrade pip
echo Processed. Press a key to return or exit.
pause >nul
goto :menu_index
::Freehand python console
:local_python
call local_python.bat
goto :menu_index
::Show python version
:python_version
%PYTHON% --version
 pause
 goto :menu_index
 ::end 
:successful_exit
endlocal
exit /b 1