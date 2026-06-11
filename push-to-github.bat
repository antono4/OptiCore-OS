@echo off
:: ==========================================
:: OptiCore OS - Push to GitHub Script (Windows)
:: ==========================================
:: Version: 1.0.0
:: Author: OptiCore Team

title OptiCore OS - Push to GitHub
color 0A

echo.
echo  ╔═══════════════════════════════════════════╗
echo  ║   OptiCore OS - Push to GitHub             ║
echo  ╚═══════════════════════════════════════════╝
echo.

set REPO_OWNER=antono4
set REPO_NAME=OptiCore-OS
set GIT_BRANCH=main

:: Get current directory
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

:: Check if git is initialized
if not exist ".git" (
    echo [ERROR] Not a git repository. Please initialize git first.
    echo Run: git init
    pause
    exit /b 1
)

:: Configure git user if not set
for /f "delims=" %%i in ('git config user.name') do set GIT_USER_SET=%%i
if "%GIT_USER_SET%"=="" (
    echo [INFO] Git user name not set. Please configure git first.
    echo Run: git config user.name "your_username"
    echo Run: git config user.email "your_email@example.com"
    pause
    exit /b 1
)

:: Set remote URL
echo [STEP 1] Setting up remote repository...
git remote get-url origin >nul 2>&1
if %errorlevel% equ 0 (
    echo [INFO] Remote 'origin' already exists.
    set /p UPDATE_REMOTE=Update remote URL? (y/n): 
    if /i "%UPDATE_REMOTE%"=="y" (
        git remote set-url origin "https://github.com/%REPO_OWNER%/%REPO_NAME%.git"
        echo [OK] Remote URL updated
    )
) else (
    git remote add origin "https://github.com/%REPO_OWNER%/%REPO_NAME%.git"
    echo [OK] Remote 'origin' added
)

:: Show current status
echo.
echo [STEP 2] Git Status
echo ----------------------------------------
git status
echo ----------------------------------------

:: Push to GitHub
echo.
echo [STEP 3] Pushing to GitHub...
echo Repository: https://github.com/%REPO_OWNER%/%REPO_NAME%
echo Branch: %GIT_BRANCH%
echo.

:: Set upstream and push
git branch -M %GIT_BRANCH%
git push -u origin %GIT_BRANCH% --force

if %errorlevel% equ 0 (
    echo.
    echo  ╔═══════════════════════════════════════════╗
    echo  ║        Push Successful! 🎉               ║
    echo  ╚═══════════════════════════════════════════╝
    echo.
    echo Repository URL: https://github.com/%REPO_OWNER%/%REPO_NAME%
    echo.
) else (
    echo.
    echo  ╔═══════════════════════════════════════════╗
    echo  ║        Push Failed!                      ║
    echo  ╚═══════════════════════════════════════════╝
    echo.
    echo Troubleshooting:
    echo 1. Make sure repository '%REPO_NAME%' exists on GitHub
    echo 2. Check your GitHub credentials
    echo 3. Ensure you have push permissions
    echo.
    echo Create repository at:
    echo https://github.com/new
    echo.
)

echo.
pause