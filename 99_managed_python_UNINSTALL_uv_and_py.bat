@echo off
setlocal DisableDelayedExpansion

echo ------------------------------------------------
echo WARNING: This script deletes uv and all 
echo associated python versions managed by uv.
echo ------------------------------------------------
set /p "CONFIRM=Please type "951" to proceed: "

if not "%CONFIRM%"=="951" (
    echo.
    echo Verification failed. Exiting...
    pause
    exit /b
)


@echo off
if exist "%USERPROFILE%\.uv\bin" rmdir /s /q "%USERPROFILE%\.uv\bin"
set "BIN_PATH=%USERPROFILE%\.local\bin"
if exist "%BIN_PATH%\uv.exe" del /f /q "%BIN_PATH%\uv.exe"
if exist "%BIN_PATH%\uvw.exe" del /f /q "%BIN_PATH%\uvw.exe"
if exist "%BIN_PATH%\uvx.exe" del /f /q "%BIN_PATH%\uvx.exe"
echo [1/3] Purging binaries and ALL python shims from .local\bin...
if exist "%BIN_PATH%" (
    pushd "%BIN_PATH%"
    if exist "python3*" del /f /q python3*
    popd
)

if exist "%LOCALAPPDATA%\uv" rmdir /s /q "%LOCALAPPDATA%\uv"
if exist "%APPDATA%\uv" rmdir /s /q "%APPDATA%\uv"

echo.
echo Please manually check for '%BIN_PATH%' in your PATH environment variable and remove if found.
pause