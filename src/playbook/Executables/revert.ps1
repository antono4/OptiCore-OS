# ==========================================
# OptiCore OS - Revert/Rollback Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Revert all OptiCore OS optimizations

param(
    [switch]$Silent,
    [switch]$NoReboot
)

$ErrorActionPreference = "Continue"
$LogFile = "$env:TEMP\OptiCore_Revert_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-Log {
    param([string]$Message)
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogMessage = "[$Timestamp] $Message"
    Add-Content -Path $LogFile -Value $LogMessage
    if (-not $Silent) { Write-Host $Message }
}

Write-Log "OptiCore OS - Revert Started"

# ========== ELEVATION CHECK ==========
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Log "ERROR: Administrator privileges required"
    Write-Host "Please run as Administrator" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "⚠️  OptiCore OS - Revert/Rollback" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "This will restore default Windows settings." -ForegroundColor Red
Write-Host "Are you sure you want to continue? (Y/N): " -ForegroundColor Yellow -NoNewline
$confirm = Read-Host

if ($confirm -ne "Y") {
    Write-Host "Revert cancelled." -ForegroundColor Green
    exit 0
}

# ========== RESTORE SERVICES ==========
Write-Log "Restoring disabled services..."

$servicesToRestore = @(
    "DiagTrack",
    "dmwappushservice",
    "WSearch",
    "Spooler",
    "Themes",
    "TabletInputService",
    "BITS",
    "DoSvc",
    "MapsBroker",
    "lfsvc",
    "IKEEXT",
    "WMPNetworkSvc",
    "WbioSvc",
    "SharedAccess",
    "PhoneSvc",
    "SmsRouter",
    "CscService"
)

foreach ($service in $servicesToRestore) {
    try {
        Set-Service -Name $service -StartupType Automatic -ErrorAction SilentlyContinue
        Start-Service -Name $service -ErrorAction SilentlyContinue
        Write-Log "Restored: $service"
    } catch { }
}

# ========== RESTORE PRIVACY ==========
Write-Log "Restoring privacy settings..."

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaEnabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Allow" -Type String -Force

# ========== RESTORE GAME SETTINGS ==========
Write-Log "Restoring game settings..."

Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameBar" -Name "AutoGameModeEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameMode" -Name "GameModeEnabled" -Value 0 -Type DWord -Force

# ========== RESTORE NETWORK ==========
Write-Log "Restoring network settings..."

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 2 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCPNoDelay" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpTimedWaitDelay" -Value 240 -Type DWord -Force

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 10 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 10 -Type DWord -Force

# ========== RESTORE POWER PLAN ==========
Write-Log "Restoring balanced power plan..."

try {
    powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e  # Balanced
    Write-Log "Balanced power plan restored"
} catch {
    Write-Log "Could not restore power plan"
}

# ========== RESTORE HIBERNATE ==========
Write-Log "Enabling Hibernate..."

powercfg /hibernate on

# ========== RESTORE VISUAL EFFECTS ==========
Write-Log "Restoring visual effects..."

Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value (0x90,0x12,0x07,0x80) -Type Binary -Force

# ========== RESTORE AUTOPLAY ==========
Write-Log "Restoring AutoPlay..."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -Value 0 -Type DWord -Force

# ========== RESTORE PREFETCH ==========
Write-Log "Restoring Prefetch..."

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnablePrefetcher" -Value 3 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnableSuperfetch" -Value 3 -Type DWord -Force

# ========== RESTORE HOSTS FILE ==========
Write-Log "Restoring hosts file..."

$HostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"
$BackupHosts = Get-ChildItem -Path "$env:TEMP" -Filter "OptiCore_hosts_backup_*.txt" | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if ($BackupHosts) {
    Copy-Item -Path $BackupHosts.FullName -Destination $HostsFile -Force
    Write-Log "Hosts file restored from backup"
}

# ========== RESTORE UAC ==========
Write-Log "Restoring UAC settings..."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 1 -Type DWord -Force

# ========== FLUSH DNS ==========
Write-Log "Flushing DNS..."

ipconfig /flushdns | Out-Null

# ========== RESET WINSOCK ==========
Write-Log "Resetting Winsock..."

netsh winsock reset | Out-Null

# ========== FINAL REPORT ==========
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "✅ Revert Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "All OptiCore OS changes have been reverted." -ForegroundColor Yellow
Write-Host ""
Write-Host "Log file: $LogFile" -ForegroundColor Cyan

if (-not $NoReboot) {
    Write-Host ""
    Write-Host "System reboot required." -ForegroundColor Yellow
    $reboot = Read-Host "Reboot now? (Y/N)"
    if ($reboot -eq "Y") { Restart-Computer -Force }
}

exit 0