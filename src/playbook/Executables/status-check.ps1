# ==========================================
# OptiCore OS - Status Check Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Check optimization status

param(
    [switch]$Silent
)

$ErrorActionPreference = "Continue"

Write-Host ""
Write-Host "🔍 OptiCore OS - Status Check" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

$status = @()

# ========== SYSTEM INFO ==========
$os = Get-CimInstance Win32_OperatingSystem
$status += "═══════════════════════════════════════"
$status += "           SYSTEM INFORMATION"
$status += "═══════════════════════════════════════"
$status += "OS: $($os.Caption)"
$status += "Version: $($os.Version)"
$status += "Build: $($os.BuildNumber)"
$status += "Architecture: $($os.OSArchitecture)"
$status += ""

# ========== PERFORMANCE STATUS ==========
$status += "═══════════════════════════════════════"
$status += "         PERFORMANCE SETTINGS"
$status += "═══════════════════════════════════════"

# Power Plan
try {
    $powerPlan = (powercfg /getactivescheme) -replace '.*:\s*', ''
    $status += "Power Plan: $powerPlan"
    
    if ($powerPlan -match "High performance|8c5e7fda") {
        $status += "  [✓] High Performance Mode"
    } else {
        $status += "  [⚠] Not High Performance"
    }
} catch {
    $status += "Power Plan: Unknown"
}

# Game Mode
$gameMode = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameMode" -Name "GameModeEnabled" -ErrorAction SilentlyContinue
if ($gameMode.GameModeEnabled -eq 1) {
    $status += "Game Mode: [✓] Enabled"
} else {
    $status += "Game Mode: [✗] Disabled"
}

# Game DVR
$gameDvr = Get-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -ErrorAction SilentlyContinue
if ($gameDvr.GameDVR_Enabled -eq 0) {
    $status += "Game DVR: [✓] Disabled"
} else {
    $status += "Game DVR: [✗] Enabled"
}

# Network Throttling
$netThrottle = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -ErrorAction SilentlyContinue
if ($netThrottle.NetworkThrottlingIndex -eq 0xffffffff) {
    $status += "Network Throttling: [✓] Disabled"
} else {
    $status += "Network Throttling: [⚠] Enabled"
}

# TCP Settings
$tcpAck = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -ErrorAction SilentlyContinue
if ($tcpAck.TcpAckFrequency -eq 1) {
    $status += "TCP Ack Frequency: [✓] Optimized"
} else {
    $status += "TCP Ack Frequency: [⚠] Default"
}

$status += ""

# ========== PRIVACY STATUS ==========
$status += "═══════════════════════════════════════"
$status += "           PRIVACY SETTINGS"
$status += "═══════════════════════════════════════"

# Telemetry Service
$diagTrack = Get-Service -Name DiagTrack -ErrorAction SilentlyContinue
if ($diagTrack.StartType -eq "Disabled") {
    $status += "Telemetry Service: [✓] Disabled"
} else {
    $status += "Telemetry Service: [✗] Enabled"
}

# Advertising ID
$adId = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -ErrorAction SilentlyContinue
if ($adId.Enabled -eq 0) {
    $status += "Advertising ID: [✓] Disabled"
} else {
    $status += "Advertising ID: [✗] Enabled"
}

# Cortana
$cortana = Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -ErrorAction SilentlyContinue
if ($cortana.AllowCortana -eq 0) {
    $status += "Cortana: [✓] Disabled"
} else {
    $status += "Cortana: [✗] Enabled"
}

# Location
$location = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -ErrorAction SilentlyContinue
if ($location.Value -eq "Deny") {
    $status += "Location Tracking: [✓] Blocked"
} else {
    $status += "Location Tracking: [✗] Allowed"
}

$status += ""

# ========== SECURITY STATUS ==========
$status += "═══════════════════════════════════════"
$status += "          SECURITY SETTINGS"
$status += "═══════════════════════════════════════"

# UAC
$uac = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -ErrorAction SilentlyContinue
if ($uac.EnableLUA -eq 1) {
    $status += "UAC: [✓] Enabled"
} else {
    $status += "UAC: [✗] Disabled"
}

# SmartScreen
$smartScreen = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -ErrorAction SilentlyContinue
if ($smartScreen.SmartScreenEnabled -eq "WarnAndPreventDefault") {
    $status += "SmartScreen: [✓] Enabled (Block)"
} elseif ($smartScreen.SmartScreenEnabled -eq "Warn") {
    $status += "SmartScreen: [⚠] Enabled (Warn Only)"
} else {
    $status += "SmartScreen: [✗] Disabled"
}

# SMB1
$smb1 = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB1" -ErrorAction SilentlyContinue
if ($smb1.SMB1 -eq 0) {
    $status += "SMBv1: [✓] Disabled"
} else {
    $status += "SMBv1: [⚠] Enabled (Not Recommended)"
}

# Windows Defender
$defender = Get-MpComputerStatus -ErrorAction SilentlyContinue
if ($defender) {
    if ($defender.AntivirusEnabled -and $defender.RealTimeProtectionEnabled) {
        $status += "Windows Defender: [✓] Active"
    } else {
        $status += "Windows Defender: [⚠] Not Fully Active"
    }
}

$status += ""

# ========== USABILITY STATUS ==========
$status += "═══════════════════════════════════════"
$status += "          USABILITY SETTINGS"
$status += "═══════════════════════════════════════"

# Visual Effects
$visual = Get-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -ErrorAction SilentlyContinue
if ($visual.DragFullWindows -eq 0) {
    $status += "Visual Effects: [✓] Optimized"
} else {
    $status += "Visual Effects: [⚠] Default"
}

# AutoPlay
$autoplay = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -ErrorAction SilentlyContinue
if ($autoplay.DisableAutoplay -eq 1) {
    $status += "AutoPlay: [✓] Disabled"
} else {
    $status += "AutoPlay: [✗] Enabled"
}

# Hibernate
$hiber = powercfg /a | Select-String "Hibernate"
if ($hiber -match "Hibernate\s*\(on\)") {
    $status += "Hibernate: [✗] Enabled"
} else {
    $status += "Hibernate: [✓] Disabled"
}

$status += ""

# ========== OPTIMIZATION SCORE ==========
$status += "═══════════════════════════════════════"
$status += "        OPTIMIZATION SCORE"
$status += "═══════════════════════════════════════"

$enabledCount = ($status | Select-String "\[✓\]").Count
$totalItems = ($status | Select-String "\[✓\]\|\[✗\]\|\[⚠\]").Count
$score = [math]::Round(($enabledCount / $totalItems) * 100, 1)

$status += "Score: $score% ($enabledCount/$totalItems optimizations)"
$status += ""

if ($score -ge 80) {
    $status += "🌟 Excellent! System is well optimized."
} elseif ($score -ge 60) {
    $status += "👍 Good! Most optimizations are active."
} elseif ($score -ge 40) {
    $status += "⚠️ Moderate. Some optimizations missing."
} else {
    $status += "❌ Poor. Run OptiCore OS scripts to optimize."
}

$status += ""
$status += "═══════════════════════════════════════"

# Display
foreach ($line in $status) {
    if ($line -match "\[✓\]") {
        Write-Host $line -ForegroundColor Green
    } elseif ($line -match "\[✗\]") {
        Write-Host $line -ForegroundColor Red
    } elseif ($line -match "\[⚠\]") {
        Write-Host $line -ForegroundColor Yellow
    } elseif ($line -match "═") {
        Write-Host $line -ForegroundColor Cyan
    } else {
        Write-Host $line
    }
}

Write-Host ""
Write-Host "Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Gray

exit 0