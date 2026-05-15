@echo off
setlocal
set "VENV_DIR=.venv"

:: Check if venv exists
if not exist "%VENV_DIR%" (
    echo [ERROR] No virtual environment found in this directory.
    echo Please run your setup script first.
    pause
    exit /b
)

echo ------------------------------------------------
echo ACTIVATING: %VENV_DIR%
echo PACKAGES INSTALLED:
echo ------------------------------------------------

:: Use uv to list packages - it's faster and cleaner
call uv pip list

echo ------------------------------------------------
echo Entering Virtual Environment... Type 'exit' to close.
echo ------------------------------------------------

:: Launch the shell and keep it open
cmd /k "%VENV_DIR%\Scripts\activate.bat"