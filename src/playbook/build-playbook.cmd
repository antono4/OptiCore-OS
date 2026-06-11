@echo off
:: ==========================================
:: OptiCore OS - Playbook Builder
:: ==========================================
:: Version: 1.0.0
:: Author: OptiCore Team
:: Description: Build OptiCore OS Playbook

title OptiCore OS - Playbook Builder
color 0A

echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║     OptiCore OS - Playbook Builder        ║
echo  ║             Version 1.0.0                 ║
echo  ╚═══════════════════════════════════════════╝
echo.

set "SOURCE=%~dp0"
set "OUTPUT=%SOURCE%OptiCoreOS"
set "PASSWORD=opticore"

:: Check if 7-Zip is available
where 7z >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] 7-Zip not found. Please install 7-Zip to build the playbook.
    echo Download: https://www.7-zip.org/
    pause
    exit /b 1
)

:: Create output directory
echo [INFO] Creating output directory...
if not exist "%OUTPUT%" mkdir "%OUTPUT%"

:: Copy configuration files
echo [INFO] Copying configuration files...
xcopy /E /I /Y "%SOURCE%Configuration" "%OUTPUT%\Configuration" >nul 2>&1

:: Copy executables
echo [INFO] Copying executables...
xcopy /E /I /Y "%SOURCE%Executables" "%OUTPUT%\Executables" >nul 2>&1

:: Copy images
echo [INFO] Copying images...
if exist "%SOURCE%Images" (
    xcopy /E /I /Y "%SOURCE%Images" "%OUTPUT%\Images" >nul 2>&1
)

:: Copy playbook.conf
echo [INFO] Copying playbook configuration...
copy /Y "%SOURCE%playbook.conf" "%OUTPUT%\playbook.conf" >nul 2>&1

:: Create the playbook archive
echo [INFO] Building playbook...
cd /d "%SOURCE%"
7z a -tzip -p%PASSWORD% "%SOURCE%OptiCoreOS.playbook" "%OUTPUT%\*" >nul 2>&1

if %errorlevel% equ 0 (
    echo.
    echo  ╔═══════════════════════════════════════════╗
    echo  ║        Build Successful!                   ║
    echo  ╚═══════════════════════════════════════════╝
    echo.
    echo Output: %SOURCE%OptiCoreOS.playbook
    echo Password: %PASSWORD%
    echo.
    echo [NOTE] Use AME Wizard to apply this playbook:
    echo   1. Download AME Wizard from https://amelimes.com/
    echo   2. Run AME Wizard and load OptiCoreOS.playbook
    echo   3. Enter password: opticore
    echo.
) else (
    echo.
    echo [ERROR] Build failed!
    echo.
)

pause