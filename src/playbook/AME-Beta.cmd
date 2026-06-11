@echo off
:: ============================================
:: OptiCore OS - AME Beta Launcher
:: Version: 1.0.0
:: Password: malte
:: ============================================

title OptiCore OS - AME Beta Launcher
color 0A

echo.
echo  ============================================================
echo     _   _ _   _ ____ _____ ____  _   _ ___ _   _ _____ ____  
echo    ^|^| \^|^| ^| \^|^| ^| __^|_   _\^^^/ \^| ^| \^| \__/  ^|_   _\^^^/ \^| ^| \^| \__/
echo    ^|^|  ^|^| ^|  ^|^| ^| _^|  ^| ^|  \^/  ^| ^|^|  ^|^| \^^^/  ^| ^|  \^/  ^| ^|^|  ^|^| \
echo    ^|^| ^|^| ^|^| ^|^| ^|^|   ^| ^| ^|^| ^|^| ^|^| ^|^| ^|^| ^|^|   ^| ^| ^|^| ^|^| ^|^| ^|^|
echo    ^|_^|_^|\__^|\__^|_^|  ^|_^| ^|_^| ^|_^|\__^|_^| ^|_^| ^|_^|  ^|_^| ^|_^| ^|_^|\__^|_^|
echo.
echo           Premium Windows Optimization System
echo                    Version 1.0.0
echo  ============================================================
echo.

:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  [!] This script requires Administrator privileges!
    echo  Please right-click and select 'Run as Administrator'
    echo.
    pause
    exit /b 1
)

:: Set password
set "PASSWORD=malte"

:: Get password from user
echo  Enter Playbook Password:
set /p INPUT_PASS=

if not "%INPUT_PASS%"=="%PASSWORD%" (
    echo.
    echo  [ERROR] Invalid password!
    echo  Please enter the correct password: malte
    echo.
    pause
    exit /b 1
)

echo  [OK] Password verified!
echo.

:: Check for PowerShell
where powershell >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] PowerShell not found!
    echo  Please install Windows PowerShell
    echo.
    pause
    exit /b 1
)

:: Get script directory
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

:: Run AME-Beta.ps1
echo  [>] Starting OptiCore OS...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%AME-Beta.ps1" -Password malte

echo.
echo  ============================================================
echo     Thank you for using OptiCore OS!
echo  ============================================================
echo.

pause