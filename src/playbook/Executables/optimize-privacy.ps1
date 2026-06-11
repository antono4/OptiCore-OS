# ==========================================
# OptiCore OS - Privacy Optimization Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Comprehensive privacy optimizations

param(
    [switch]$Silent,
    [switch]$NoReboot
)

$ErrorActionPreference = "Continue"
$LogFile = "$env:TEMP\OptiCore_Privacy_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-Log {
    param([string]$Message)
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogMessage = "[$Timestamp] $Message"
    Add-Content -Path $LogFile -Value $LogMessage
    if (-not $Silent) {
        Write-Host $Message
    }
}

Write-Log "OptiCore OS - Privacy Optimization Started"

# ========== ELEVATION CHECK ==========
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Log "ERROR: Administrator privileges required"
    Write-Host "Please run as Administrator" -ForegroundColor Red
    exit 1
}

Write-Log "Administrator privileges confirmed"

# ========== DISABLE TELEMETRY ==========
Write-Log "Disabling telemetry services..."

$TelemetryServices = @(
    "DiagTrack",
    "dmwappushservice",
    "PimIndexMaintenanceSvc",
    "MessagingService",
    "UserDataSvc",
    "UnistoreSvc"
)

foreach ($service in $TelemetryServices) {
    try {
        $svc = Get-Service -Name $service -ErrorAction SilentlyContinue
        if ($svc) {
            Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
            Set-Service -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
            Write-Log "Disabled telemetry: $service"
        }
    } catch {
        Write-Log "Could not disable: $service"
    }
}

# ========== DISABLE ADVERTISING ID ==========
Write-Log "Disabling advertising ID..."

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -Type DWord -Force

# ========== DISABLE CORTANA ==========
Write-Log "Disabling Cortana..."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaEnabled" -Value 0 -Type DWord -Force

# Disable Cortana in Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCortanaButton" -Value 0 -Type DWord -Force

# ========== DISABLE LOCATION ==========
Write-Log "Disabling location services..."

Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny" -Type String -Force

$LocationServices = @(
    "lfsvc",
    "SharedAccess"
)

foreach ($service in $LocationServices) {
    try {
        $svc = Get-Service -Name $service -ErrorAction SilentlyContinue
        if ($svc) {
            Set-Service -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
            Write-Log "Disabled location service: $service"
        }
    } catch {
        Write-Log "Could not disable: $service"
    }
}

# ========== DISABLE ACTIVITY HISTORY ==========
Write-Log "Disabling activity history..."

Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "ActivityHistoryEnabled" -Value 0 -Type DWord -Force

# ========== DISABLE FEEDBACK ==========
Write-Log "Disabling feedback and diagnostics..."

Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Feedback" -Name "DisableFeedback" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\Software\WOW6432Node\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWord -Force

# ========== DISABLE TAILORED EXPERIENCES ==========
Write-Log "Disabling tailored experiences..."

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Value 1 -Type DWord -Force

# ========== DISABLE WIFI SENSE ==========
Write-Log "Disabling WiFi Sense..."

Set-ItemProperty -Path "HKLM:\Software\Microsoft\WcmSvc\wifinetworkmanager\config" -Name "AutoConnectAllowed" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\Software\Microsoft\WcmSvc\wifinetworkmanager\config" -Name "WiFiSenseAllowed" -Value 0 -Type DWord -Force

# ========== DISABLE DIAGNOSTIC DATA ==========
Write-Log "Disabling diagnostic data collection..."

Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" -Name "ShowSpeechOption" -Value 0 -Type DWord -Force

# ========== DISABLE HANDSWRITING DATA COLLECTION ==========
Write-Log "Disabling handwriting data collection..."

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "HandwritingDataAccessibility" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "HandwritingDictationEnabled" -Value 0 -Type DWord -Force

# ========== DISABLE APP COMPATIBILITY TELEMETRY ==========
Write-Log "Disabling app compatibility telemetry..."

Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\AppCompat" -Name "AITEnable" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\AppVISe" -Name "DisableUwpASharedContext" -Value 1 -Type DWord -Force

# ========== BLOCK HOSTS ==========
Write-Log "Blocking telemetry domains..."

$TelemetryHosts = @(
    "vortex.data.microsoft.com",
    "settings-win.data.microsoft.com",
    "watson.telemetry.microsoft.com",
    "telemetry.microsoft.com",
    "vortex-sandbox.data.microsoft.com",
    "settings-sandbox.data.microsoft.com"
)

$HostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"
$BackupHosts = "$env:TEMP\OptiCore_hosts_backup_$(Get-Date -Format 'yyyyMMdd').txt"

# Backup hosts file
if (Test-Path $HostsFile) {
    Copy-Item -Path $HostsFile -Destination $BackupHosts -Force
    Write-Log "Hosts file backed up to: $BackupHosts"
}

# Add telemetry blocks
$BlockEntries = @"
# OptiCore OS Telemetry Blocks
127.0.0.1 vortex.data.microsoft.com
127.0.0.1 settings-win.data.microsoft.com
127.0.0.1 watson.telemetry.microsoft.com
127.0.0.1 telemetry.microsoft.com
127.0.0.1 v10.vortex-win.data.microsoft.com
127.0.0.1 settings-win.data.microsoft.com
127.0.0.1 watson.live.com
127.0.0.1 in.appcenter.ms
127.0.0.1 in.vortex.data.microsoft.com
127.0.0.1 vortex-sandbox.data.microsoft.com
127.0.0.1 settings-sandbox.data.microsoft.com
"@

$CurrentHosts = Get-Content -Path $HostsFile -ErrorAction SilentlyContinue
if ($CurrentHosts -notlike "*OptiCore OS Telemetry Blocks*") {
    Add-Content -Path $HostsFile -Value $BlockEntries -ErrorAction SilentlyContinue
    Write-Log "Added telemetry blocks to hosts file"
}

# Flush DNS
ipconfig /flushdns | Out-Null
Write-Log "DNS cache flushed"

Write-Log "Privacy optimization completed!"
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "OptiCore OS Privacy Optimization Complete" -ForegroundColor Green
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