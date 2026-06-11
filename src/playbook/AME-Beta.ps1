# ============================================
# OptiCore OS - AME Beta Launcher
# Version: 1.0.0
# Password: malte
# ============================================

param(
    [string]$Password = "",
    [switch]$Silent,
    [switch]$Extract
)

$ErrorActionPreference = "Continue"
$Global:LogFile = "$env:TEMP\OptiCoreOS_AME_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-AME-Log {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    Write-Host $logEntry
    Add-Content -Path $Global:LogFile -Value $logEntry -ErrorAction SilentlyContinue
}

function Show-AME-Banner {
    Clear-Host
    Write-Host ""
    Write-Host "  ============================================================" -ForegroundColor Cyan
    Write-Host "     ____  __  __    _    ____  _   _ ____  _____ ____  _  _______ _____" -ForegroundColor Cyan
    Write-Host "    |  _ \|  \/  |  / \  |  _ \| | | |  _ \| ____|  _ \| |/ /_   _\__   __|" -ForegroundColor Cyan
    Write-Host "    | |_) | |\/| | / _ \ | |_) | | | | |_) |  _| | |_) | ' /  | |    | |" -ForegroundColor Cyan
    Write-Host "    |  _ <| |  | |/ ___ \|  _ <| |_| |  _ <| |___|  _ <| . \  | |    | |" -ForegroundColor Cyan
    Write-Host "    |_| \_\_|  |_/_/   \_\_| \_\\___/|_| \_\_____|_| \_\_|\_\ |_|    |_|" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "           Premium Windows Optimization System" -ForegroundColor Cyan
    Write-Host "                    Version 1.0.0" -ForegroundColor Yellow
    Write-Host "  ============================================================" -ForegroundColor Cyan
    Write-Host ""
}

function Get-Password {
    if ($Password -ne "" -and $Password -eq "malte") {
        return $true
    }
    
    Write-Host "  Enter Playbook Password: " -NoNewline -ForegroundColor Yellow
    $inputPass = Read-Host
    if ($inputPass -eq "malte") {
        return $true
    }
    Write-AME-Log "Invalid password attempt" "ERROR"
    return $false
}

function Show-Menu {
    Write-Host ""
    Write-Host "  ╔════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "  ║            OptiCore OS - Main Menu               ║" -ForegroundColor Green
    Write-Host "  ╠════════════════════════════════════════════════════╣" -ForegroundColor Green
    Write-Host "  ║  [1] Apply All Optimizations                      ║" -ForegroundColor White
    Write-Host "  ║  [2] Gaming Optimization                          ║" -ForegroundColor White
    Write-Host "  ║  [3] Privacy Optimization                         ║" -ForegroundColor White
    Write-Host "  ║  [4] Network Optimization                         ║" -ForegroundColor White
    Write-Host "  ║  [5] Battery Optimization                         ║" -ForegroundColor White
    Write-Host "  ║  [6] Security Hardening                           ║" -ForegroundColor White
    Write-Host "  ║  [7] System Benchmark                            ║" -ForegroundColor White
    Write-Host "  ║  [8] Status Check                                ║" -ForegroundColor White
    Write-Host "  ║  [9] Export Configuration                         ║" -ForegroundColor White
    Write-Host "  ║  [R] Revert All Changes                          ║" -ForegroundColor Yellow
    Write-Host "  ║  [X] Exit                                        ║" -ForegroundColor Red
    Write-Host "  ╚════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
}

function Invoke-Script {
    param([string]$ScriptPath, [string]$Name)
    Write-Host ""
    Write-Host "  [>] Running: $Name" -ForegroundColor Cyan
    
    if (Test-Path $ScriptPath) {
        try {
            $output = & $ScriptPath 2>&1
            Write-Host "  [OK] $Name completed" -ForegroundColor Green
            Write-AME-Log "Executed: $Name" "INFO"
            return $true
        }
        catch {
            Write-Host "  [X] $Name failed: $_" -ForegroundColor Red
            Write-AME-Log "Failed: $Name - $_" "ERROR"
            return $false
        }
    }
    else {
        Write-Host "  [!] Script not found: $ScriptPath" -ForegroundColor Yellow
        return $false
    }
}

function Apply-All-Optimizations {
    Write-Host ""
    Write-Host "  [+] Applying All Optimizations..." -ForegroundColor Magenta
    
    $scripts = @(
        @{Path="Executables\optimize-core.ps1"; Name="Core Optimization"},
        @{Path="Executables\optimize-privacy.ps1"; Name="Privacy Enhancement"},
        @{Path="Executables\optimize-security.ps1"; Name="Security Hardening"},
        @{Path="Executables\optimize-gaming.ps1"; Name="Gaming Optimization"},
        @{Path="Executables\optimize-network.ps1"; Name="Network Optimization"},
        @{Path="Executables\optimize-battery.ps1"; Name="Battery Optimization"}
    )
    
    $success = 0
    foreach ($script in $scripts) {
        if (Invoke-Script -ScriptPath $script.Path -Name $script.Name) {
            $success++
        }
        Start-Sleep -Milliseconds 500
    }
    
    Write-Host ""
    Write-Host "  [SUCCESS] Optimization Complete!" -ForegroundColor Green
    Write-Host "  [$success/$($scripts.Count)] scripts executed successfully" -ForegroundColor White
    
    Write-AME-Log "Applied $success/$($scripts.Count) optimizations" "INFO"
}

function Main {
    Show-AME-Banner
    
    if (-not (Get-Password)) {
        Write-Host ""
        Write-Host "  [ERROR] Invalid password!" -ForegroundColor Red
        Write-Host "  Please enter the correct password (malte)" -ForegroundColor Yellow
        Start-Sleep -Seconds 2
        exit 1
    }
    
    Write-Host "  [OK] Password verified!" -ForegroundColor Green
    Write-Host "  Log file: $Global:LogFile" -ForegroundColor DarkGray
    Write-AME-Log "AME Beta started - Password verified" "INFO"
    
    Start-Sleep -Seconds 1
    
    if ($Silent) {
        Apply-All-Optimizations
        return
    }
    
    while ($true) {
        Show-Menu
        Write-Host "  Select option: " -NoNewline -ForegroundColor Cyan
        $choice = Read-Host
        
        switch ($choice.ToUpper()) {
            "1" { Apply-All-Optimizations }
            "2" { Invoke-Script -ScriptPath "Executables\optimize-gaming.ps1" -Name "Gaming Optimization" }
            "3" { Invoke-Script -ScriptPath "Executables\optimize-privacy.ps1" -Name "Privacy Enhancement" }
            "4" { Invoke-Script -ScriptPath "Executables\optimize-network.ps1" -Name "Network Optimization" }
            "5" { Invoke-Script -ScriptPath "Executables\optimize-battery.ps1" -Name "Battery Optimization" }
            "6" { Invoke-Script -ScriptPath "Executables\optimize-security.ps1" -Name "Security Hardening" }
            "7" { Invoke-Script -ScriptPath "Executables\benchmark.ps1" -Name "System Benchmark" }
            "8" { Invoke-Script -ScriptPath "Executables\status-check.ps1" -Name "Status Check" }
            "9" { Invoke-Script -ScriptPath "Executables\export-config.ps1" -Name "Export Configuration" }
            "R" {
                Write-Host ""
                Write-Host "  [!] WARNING: This will revert all OptiCore OS changes!" -ForegroundColor Yellow
                Write-Host "  Press [Y] to confirm: " -NoNewline
                $confirm = Read-Host
                if ($confirm -eq "Y") {
                    Invoke-Script -ScriptPath "Executables\revert.ps1" -Name "Revert All Changes"
                }
            }
            "X" {
                Write-Host ""
                Write-Host "  [THANK YOU] OptiCore OS - Goodbye!" -ForegroundColor Cyan
                exit 0
            }
            default {
                Write-Host "  [ERROR] Invalid option!" -ForegroundColor Red
            }
        }
        
        Write-Host ""
        Write-Host "  Press Enter to continue..." -ForegroundColor DarkGray
        Read-Host
    }
}

# Check for admin rights
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host ""
    Write-Host "  [!] This script requires Administrator privileges!" -ForegroundColor Yellow
    Write-Host "  Please right-click and select 'Run as Administrator'" -ForegroundColor Yellow
    Write-Host ""
    Start-Sleep -Seconds 3
    exit 1
}

Main