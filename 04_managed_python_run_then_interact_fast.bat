@echo off
setlocal DisableDelayedExpansion

set "VENV_DIR=.venv"
set "SETUP_LOG=activity_PYSETUP.log"
echo --- SETUP START: %date% %time% --- > "%SETUP_LOG%"

set "PY_FILE="
set "COUNT=0"

for /f "delims=" %%f in ('dir /b /a-d /on *.py 2^>nul') do (
    set /a COUNT+=1
    call set "FILE_%%COUNT%%=%%f"
)

if %COUNT% equ 0 (
    echo No files found. Opening Picker...
    for /f "usebackq delims=" %%I in (`powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $f = New-Object System.Windows.Forms.OpenFileDialog; $f.Filter = 'Python (*.py)|*.py'; $f.ShowDialog() | Out-Null; $f.FileName"`) do set "PY_FILE=%%I"
) else if %COUNT% equ 1 (
    set "PY_FILE=%FILE_1%"
) else (
    for /l %%i in (1,1,%COUNT%) do (
        call echo [%%i] %%FILE_%%i%%
    )
    set /p "CHOICE=Enter SNo: "
    for /l %%i in (1,1,%COUNT%) do (
        call if "%%CHOICE%%"=="%%i" set "PY_FILE=%%FILE_%%i%%"
    )
)

if "%PY_FILE%"=="" goto TRAP

for %%A in ("%PY_FILE%") do set "S_NAME=%%~nxA"
set "RUN_LOG=activity_%S_NAME%.log"

echo Running: %PY_FILE%
echo --- EXECUTION START: %date% %time% --- > "%RUN_LOG%"

set PYTHONUNBUFFERED=1

uv run python -i "%PY_FILE%"
if %errorlevel% neq 0 (
    echo SCRIPT CRASHED WITH CODE %errorlevel% >> "%RUN_LOG%"
) else (
    echo SCRIPT FINISHED SUCCESSFULLY >> "%RUN_LOG%"
)

:TRAP
echo.
echo ------------------------------------------------
echo Task Finished. Enter 8 to close.
echo ------------------------------------------------
set /p "EXIT_VAL=> "
if "%EXIT_VAL%"=="8" exit
goto TRAP