@echo off
setlocal DisableDelayedExpansion

echo ------------------------------------------------
echo WARNING: This script will install uv python manager
echo ------------------------------------------------
set /p "CONFIRM=Please type "951" to proceed: "

if not "%CONFIRM%"=="951" (
    echo.
    echo Verification failed. Exiting...
    pause
    exit /b
)

powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"