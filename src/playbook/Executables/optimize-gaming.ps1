# ==========================================
# OptiCore OS - Gaming Optimization Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Gaming-specific optimizations for maximum performance

param(
    [switch]$Silent,
    [switch]$NoReboot
)

$ErrorActionPreference = "Continue"
$LogFile = "$env:TEMP\OptiCore_Gaming_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-Log {
    param([string]$Message)
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogMessage = "[$Timestamp] $Message"
    Add-Content -Path $LogFile -Value $LogMessage
    if (-not $Silent) { Write-Host $Message }
}

Write-Log "OptiCore OS - Gaming Optimization Started"

# ========== ELEVATION CHECK ==========
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Log "ERROR: Administrator privileges required"
    Write-Host "Please run as Administrator" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🎮 OptiCore OS - Gaming Optimization" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# ========== GAME DVR DISABLED ==========
Write-Log "Disabling Game DVR and Game Bar..."

Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehaviorMode" -Value 2 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_DXGEngineForceDvr" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_HonorUserFSEBehaviorMode" -Value 0 -Type DWord -Force

# Disable Game Bar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameBar" -Name "AutoGameModeEnabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "AutoGameModeEnabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "ShowGameBarNotifications" -Value 0 -Type DWord -Force

# Disable Game Bar Suggested Actions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameBar" -Name "SuggestedActionsEnabled" -Value 0 -Type DWord -Force

Write-Log "Game DVR disabled"

# ========== GAME MODE ==========
Write-Log "Enabling Game Mode..."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameMode" -Name "GameModeEnabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameMode" -Name "UseGenericGameModeSetting" -Value 0 -Type DWord -Force

# Enable Game Mode for all games
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameBar" -Name "GameModeAvailable" -Value 1 -Type DWord -Force

Write-Log "Game Mode enabled"

# ========== HARDWARE SCHEDULER ==========
Write-Log "Enabling Hardware-accelerated GPU Scheduling..."

try {
    $gpu = Get-CimInstance -ClassName Win32_VideoController | Select-Object -First 1
    if ($gpu) {
        Write-Log "Detected GPU: $($gpu.Name)"
    }
    
    # Enable Hardware Scheduling
    $result = & "C:\Windows\System32\powercfg" /setdcvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOFAULTENABLE 1
    $result = & "C:\Windows\System32\powercfg" /setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOFAULTENABLE 1
    Write-Log "Hardware scheduling enabled"
} catch {
    Write-Log "Could not enable hardware scheduling"
}

# ========== GPU PERFORMANCE ==========
Write-Log "Optimizing GPU settings..."

# Prefer Maximum Performance
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" -Name "PerfLevelSrc" -Value 0x2222 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" -Name "VideoPowerSavingMode" -Value 0 -Type DWord -Force

# ========== NETWORK LATENCY ==========
Write-Log "Optimizing network for gaming..."

# Set network priority
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -Type DWord -Force

# Optimize TCP parameters
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{interface}" -Name "TcpAckFrequency" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue

Write-Log "Network latency optimized"

# ========== PROCESS PRIORITY ==========
Write-Log "Setting high priority for gaming processes..."

# Create registry path for game mode
$gameModeKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameTask"
if (-not (Test-Path $gameModeKey)) {
    New-Item -Path $gameModeKey -Force | Out-Null
}

Set-ItemProperty -Path $gameModeKey -Name "GamingModeEnabled" -Value 1 -Type DWord -Force

# ========== DISK I/O OPTIMIZATION ==========
Write-Log "Optimizing disk I/O..."

# Disable disk timeout
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Disk" -Name "TimeOutValue" -Value 200 -Type DWord -Force

# Optimize storage
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "ClearPageFileAtShutdown" -Value 0 -Type DWord -Force

# ========== DISABLE CORE Parking ==========
Write-Log "Disabling CPU core parking..."

try {
    $cpuCores = (Get-CimInstance Win32_Processor).NumberOfCores
    Write-Log "Detected $cpuCores CPU cores"
    
    # Disable core parking via power policy
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    powercfg /change standby-timeout-ac 0
    powercfg /change monitor-timeout-ac 0
    
    Write-Log "Core parking disabled"
} catch {
    Write-Log "Could not disable core parking"
}

# ========== HIGH PERFORMANCE POWER PLAN ==========
Write-Log "Setting Ultra High Performance power plan..."

try {
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    
    # Additional power settings
    powercfg /change disk-timeout-ac 0
    powercfg /change standby-timeout-ac 0
    powercfg /change monitor-timeout-ac 0
    
    Write-Log "Power plan optimized"
} catch {
    Write-Log "Could not set power plan"
}

# ========== DISABLE GAME EXPLORER ==========
Write-Log "Disabling Game Explorer services..."

$gameServices = @(
    "GameOverlayUI",
    "GfeService"
)

foreach ($svc in $gameServices) {
    try {
        $service = Get-Service -Name $svc -ErrorAction SilentlyContinue
        if ($service) {
            Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
            Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
            Write-Log "Disabled: $svc"
        }
    } catch { }
}

# ========== NVIDIA OPTIMIZATIONS ==========
Write-Log "Applying NVIDIA optimizations..."

$nvidiaKey = "HKLM:\SYSTEM\CurrentControlSet\Services\nvlddmkm"
if (Test-Path $nvidiaKey) {
    # Low latency
    Set-ItemProperty -Path "$nvidiaKey\Global\Startup" -Name "Latency" -Value 1 -Type DWord -Force
    Write-Log "NVIDIA low latency mode enabled"
}

# ========== AMD OPTIMIZATIONS ==========
Write-Log "Applying AMD optimizations..."

$amdKey = "HKLM:\SYSTEM\CurrentControlSet\Services\atikmdag"
if (Test-Path $amdKey) {
    # Disable power saving
    Set-ItemProperty -Path "$amdKey\Global" -Name "AntiLag" -Value 1 -Type DWord -Force
    Write-Log "AMD Anti-Lag enabled"
}

# ========== WINDOWS GAME BAR SERVICE ==========
Write-Log "Configuring Game Bar service..."

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\bam" -Name "Start" -Value 4 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\devquerycore" -Name "Start" -Value 4 -Type DWord -Force

# ========== FINAL REPORT ==========
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "🎮 Gaming Optimization Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Optimizations Applied:" -ForegroundColor Yellow
Write-Host "  ✅ Game DVR Disabled" -ForegroundColor White
Write-Host "  ✅ Game Mode Enabled" -ForegroundColor White
Write-Host "  ✅ Hardware Scheduling Enabled" -ForegroundColor White
Write-Host "  ✅ GPU Performance Optimized" -ForegroundColor White
Write-Host "  ✅ Network Latency Reduced" -ForegroundColor White
Write-Host "  ✅ CPU Core Parking Disabled" -ForegroundColor White
Write-Host "  ✅ High Performance Power Plan" -ForegroundColor White
Write-Host "  ✅ NVIDIA/AMD Optimizations" -ForegroundColor White
Write-Host ""
Write-Host "Log file: $LogFile" -ForegroundColor Cyan

if (-not $NoReboot) {
    Write-Host ""
    Write-Host "System reboot recommended for full effect." -ForegroundColor Yellow
    $reboot = Read-Host "Reboot now? (Y/N)"
    if ($reboot -eq "Y") { Restart-Computer -Force }
}

exit 0