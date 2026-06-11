# ==========================================
# OptiCore OS - Export Configuration Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Export current system configuration

param(
    [string]$OutputPath = "$env:USERPROFILE\Desktop\OptiCore_Config_$(Get-Date -Format 'yyyyMMdd_HHmmss').json"
)

$ErrorActionPreference = "Continue"

Write-Host ""
Write-Host "💾 OptiCore OS - Export Configuration" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

$config = @{
    "ExportDate" = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "ComputerName" = $env:COMPUTERNAME
    "OS" = (Get-CimInstance Win32_OperatingSystem).Caption
    "Version" = (Get-CimInstance Win32_OperatingSystem).Version
    "Performance" = @{}
    "Privacy" = @{}
    "Security" = @{}
    "Usability" = @{}
    "Services" = @{}
}

# ========== PERFORMANCE CONFIG ==========
Write-Host "Exporting performance settings..." -ForegroundColor Yellow

$powerPlan = (powercfg /getactivescheme) -replace '.*:\s*', ''
$config.Performance | Add-Member -NotePropertyName "PowerPlan" -NotePropertyValue $powerPlan

$gameMode = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameMode" -Name "GameModeEnabled" -ErrorAction SilentlyContinue
$config.Performance | Add-Member -NotePropertyName "GameMode" -NotePropertyValue ($gameMode.GameModeEnabled -eq 1)

$gameDvr = Get-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -ErrorAction SilentlyContinue
$config.Performance | Add-Member -NotePropertyName "GameDVR" -NotePropertyValue ($gameDvr.GameDVR_Enabled -eq 0)

$tcpAck = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -ErrorAction SilentlyContinue
$config.Performance | Add-Member -NotePropertyName "TcpAckFrequency" -NotePropertyValue $tcpAck.TcpAckFrequency

$netThrottle = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -ErrorAction SilentlyContinue
$config.Performance | Add-Member -NotePropertyName "NetworkThrottling" -NotePropertyValue ($netThrottle.NetworkThrottlingIndex -eq 0xffffffff)

$prefetch = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnablePrefetcher" -ErrorAction SilentlyContinue
$config.Performance | Add-Member -NotePropertyName "Prefetch" -NotePropertyValue $prefetch.EnablePrefetcher

# ========== PRIVACY CONFIG ==========
Write-Host "Exporting privacy settings..." -ForegroundColor Yellow

$diagTrack = Get-Service -Name DiagTrack -ErrorAction SilentlyContinue
$config.Privacy | Add-Member -NotePropertyName "TelemetryDisabled" -NotePropertyValue ($diagTrack.StartType -eq "Disabled")

$adId = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -ErrorAction SilentlyContinue
$config.Privacy | Add-Member -NotePropertyName "AdvertisingIdDisabled" -NotePropertyValue ($adId.Enabled -eq 0)

$cortana = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -ErrorAction SilentlyContinue
$config.Privacy | Add-Member -NotePropertyName "CortanaDisabled" -NotePropertyValue ($cortana.AllowCortana -eq 0)

$location = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -ErrorAction SilentlyContinue
$config.Privacy | Add-Member -NotePropertyName "LocationBlocked" -NotePropertyValue ($location.Value -eq "Deny")

$activityHistory = Get-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -ErrorAction SilentlyContinue
$config.Privacy | Add-Member -NotePropertyName "ActivityHistoryDisabled" -NotePropertyValue ($activityHistory.PublishUserActivities -eq 0)

# ========== SECURITY CONFIG ==========
Write-Host "Exporting security settings..." -ForegroundColor Yellow

$uac = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -ErrorAction SilentlyContinue
$config.Security | Add-Member -NotePropertyName "UACEnabled" -NotePropertyValue ($uac.EnableLUA -eq 1)

$smartScreen = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -ErrorAction SilentlyContinue
$config.Security | Add-Member -NotePropertyName "SmartScreen" -NotePropertyValue $smartScreen.SmartScreenEnabled

$smb1 = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB1" -ErrorAction SilentlyContinue
$config.Security | Add-Member -NotePropertyName "SMB1Disabled" -NotePropertyValue ($smb1.SMB1 -eq 0)

$defender = Get-MpComputerStatus -ErrorAction SilentlyContinue
if ($defender) {
    $config.Security | Add-Member -NotePropertyName "DefenderActive" -NotePropertyValue ($defender.AntivirusEnabled)
}

# ========== USABILITY CONFIG ==========
Write-Host "Exporting usability settings..." -ForegroundColor Yellow

$visual = Get-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -ErrorAction SilentlyContinue
$config.Usability | Add-Member -NotePropertyName "VisualEffectsOptimized" -NotePropertyValue ($visual.DragFullWindows -eq 0)

$autoplay = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -ErrorAction SilentlyContinue
$config.Usability | Add-Member -NotePropertyName "AutoPlayDisabled" -NotePropertyValue ($autoplay.DisableAutoplay -eq 1)

$hiber = powercfg /a | Select-String "Hibernate"
$config.Usability | Add-Member -NotePropertyName "HibernateDisabled" -NotePropertyValue (-not ($hiber -match "Hibernate\s*\(on\)"))

$thumbnails = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "DisableThumbnails" -ErrorAction SilentlyContinue
$config.Usability | Add-Member -NotePropertyName "ThumbnailsOptimized" -NotePropertyValue ($thumbnails.DisableThumbnails -eq 1)

# ========== SERVICES CONFIG ==========
Write-Host "Exporting services status..." -ForegroundColor Yellow

$servicesList = @(
    "DiagTrack", "WSearch", "Themes", "Spooler", "BITS", 
    "DoSvc", "MapsBroker", "lfsvc", "WMPNetworkSvc"
)

foreach ($svcName in $servicesList) {
    $svc = Get-Service -Name $svcName -ErrorAction SilentlyContinue
    if ($svc) {
        $config.Services | Add-Member -NotePropertyName $svcName -NotePropertyValue @{
            "Status" = $svc.Status.ToString()
            "StartType" = $svc.StartType.ToString()
        }
    }
}

# ========== SAVE CONFIG ==========
Write-Host ""
Write-Host "Saving configuration..." -ForegroundColor Yellow

try {
    $config | ConvertTo-Json -Depth 10 | Out-File -FilePath $OutputPath -Encoding UTF8
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "💾 Configuration Exported!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Saved to: $OutputPath" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "You can use this file to:" -ForegroundColor Yellow
    Write-Host "  - Compare before/after optimization" -ForegroundColor White
    Write-Host "  - Restore settings on another PC" -ForegroundColor White
    Write-Host "  - Document your optimization settings" -ForegroundColor White
    Write-Host ""
} catch {
    Write-Host "Error saving configuration: $_" -ForegroundColor Red
}

exit 0