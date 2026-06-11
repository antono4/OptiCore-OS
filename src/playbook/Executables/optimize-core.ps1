# ==========================================
# OptiCore OS - Core Optimization Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Core system optimizations

param(
    [switch]$Silent,
    [switch]$NoReboot
)

$ErrorActionPreference = "Continue"
$LogFile = "$env:TEMP\OptiCore_Core_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-Log {
    param([string]$Message)
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogMessage = "[$Timestamp] $Message"
    Add-Content -Path $LogFile -Value $LogMessage
    if (-not $Silent) {
        Write-Host $Message
    }
}

Write-Log "OptiCore OS - Core Optimization Started"

# ========== ELEVATION CHECK ==========
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Log "ERROR: Administrator privileges required"
    Write-Host "Please run as Administrator" -ForegroundColor Red
    exit 1
}

Write-Log "Administrator privileges confirmed"

# ========== DISABLE UNNECESSARY SERVICES ==========
$ServicesToDisable = @(
    "DiagTrack",           # Telemetry
    "Diagnostics",         # Diagnostics
    "WSearch",             # Windows Search (optional, can slow)
    "Spooler",             # Print Spooler (if not printing)
    "Themes",              # Themes
    "TabletInputService",  # Tablet input
    "BITS",                # Background Intelligent Transfer
    "DoSvc",               # Delivery Optimization
    "MapsBroker",          # Downloaded Maps
    "lfsvc",               # Geolocation
    "IKEEXT",              # IKE and AuthIP
    "WMPNetworkSvc",       # Windows Media Player Network Sharing
    "WbioSvc",             # Windows Biometric
    "SharedAccess",       # Internet Connection Sharing
    "PhoneSvc",            # Phone Service
    "SmsRouter",           # SMS Routing
    "CscService",          # Offline Files
    "WwanSvc"              # WWAN
)

foreach ($service in $ServicesToDisable) {
    try {
        $svc = Get-Service -Name $service -ErrorAction SilentlyContinue
        if ($svc -and $svc.StartType -ne "Disabled") {
            Set-Service -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
            Write-Log "Disabled service: $service"
        }
    } catch {
        Write-Log "Could not disable: $service"
    }
}

# ========== NETWORK OPTIMIZATIONS ==========
Write-Log "Applying network optimizations..."

# TCP Parameters
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpTimedWaitDelay" -Value 30 -Type DWord -Force

# Network Throttling
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -Force

# ========== DISK OPTIMIZATION ==========
Write-Log "Applying disk optimizations..."

# Disable Disk Compression
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout" -Name "EnableAutoLayout" -Value 0 -Type DWord -Force

# Optimize Pagefile
$pagefile = Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty AutomaticManagedPagefile
if ($pagefile) {
    $pagefile | Set-WmiInstance -Arguments @{Enable = $false} -ErrorAction SilentlyContinue
}

# ========== POWER PLAN ==========
Write-Log "Setting High Performance power plan..."

try {
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  # High Performance
    Write-Log "High Performance power plan activated"
} catch {
    Write-Log "Could not set power plan"
}

# ========== GAME MODE ==========
Write-Log "Enabling Game Mode..."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameMode" -Name "GameModeEnabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameBar" -Name "AutoGameModeEnabled" -Value 1 -Type DWord -Force

# ========== VISUAL EFFECTS ==========
Write-Log "Disabling visual effects..."

# System Properties -> Advanced -> Performance Settings
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value (0x90,0x12,0x03,0x80) -Type Binary -Force

# ========== CLEAR TEMP FILES ==========
Write-Log "Cleaning temporary files..."

$TempPaths = @(
    "$env:TEMP\*",
    "$env:LOCALAPPDATA\Temp\*",
    "C:\Windows\Temp\*"
)

foreach ($path in $TempPaths) {
    try {
        Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
    } catch { }
}

# ========== DISABLE HIBERNATE ==========
Write-Log "Disabling Hibernate..."
powercfg /hibernate off

# ========== SCHEDULER TWEAKS ==========
Write-Log "Optimizing Task Scheduler..."

# Disable maintenance tasks
Get-ScheduledTask | Where-Object { $_.TaskName -like "*Maintenance*" -or $_.TaskName -like "*Diagnostic*" } | Disable-ScheduledTask -ErrorAction SilentlyContinue

Write-Log "Core optimization completed!"
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "OptiCore OS Core Optimization Complete" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "Log file: $LogFile" -ForegroundColor Yellow

if (-not $NoReboot) {
    Write-Host ""
    Write-Host "System reboot recommended for full effect." -ForegroundColor Cyan
    $reboot = Read-Host "Reboot now? (Y/N)"
    if ($reboot -eq "Y") {
        Restart-Computer -Force
    }
}

exit 0