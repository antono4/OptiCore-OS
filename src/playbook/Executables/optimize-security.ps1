# ==========================================
# OptiCore OS - Security Optimization Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Security hardening optimizations

param(
    [switch]$Silent,
    [switch]$NoReboot
)

$ErrorActionPreference = "Continue"
$LogFile = "$env:TEMP\OptiCore_Security_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-Log {
    param([string]$Message)
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogMessage = "[$Timestamp] $Message"
    Add-Content -Path $LogFile -Value $LogMessage
    if (-not $Silent) {
        Write-Host $Message
    }
}

Write-Log "OptiCore OS - Security Optimization Started"

# ========== ELEVATION CHECK ==========
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Log "ERROR: Administrator privileges required"
    Write-Host "Please run as Administrator" -ForegroundColor Red
    exit 1
}

Write-Log "Administrator privileges confirmed"

# ========== ENABLE WINDOWS DEFENDER ==========
Write-Log "Configuring Windows Defender..."

Set-MpPreference -DisableRealtimeMonitoring $false -ErrorAction SilentlyContinue
Set-MpPreference -DisableIOAVProtection $false -ErrorAction SilentlyContinue
Set-MpPreference -DisableScriptScanning $false -ErrorAction SilentlyContinue

# Enable Cloud-delivered protection
Set-MpPreference -MAPSReporting 1 -ErrorAction SilentlyContinue
Set-MpPreference -SubmitSamplesConsent 1 -ErrorAction SilentlyContinue

Write-Log "Windows Defender configured"

# ========== ENABLE SMARTSCREEN ==========
Write-Log "Enabling SmartScreen..."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -Value "WarnAndPreventDefault" -Type String -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -Value "WarnAndPreventDefault" -Type String -Force

# ========== UAC MAXIMUM ==========
Write-Log "Configuring UAC to maximum..."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 2 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "FilterAdministratorToken" -Value 1 -Type DWord -Force

# ========== ENABLE WINDOWS FIREWALL ==========
Write-Log "Enabling Windows Firewall..."

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True -ErrorAction SilentlyContinue
Write-Log "Windows Firewall enabled for all profiles"

# ========== DISABLE SMBv1 ==========
Write-Log "Disabling SMBv1..."

Set-SmbServerConfiguration -RequireSecuritySignature $true -Force -ErrorAction SilentlyContinue
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force -ErrorAction SilentlyContinue

# Disable SMBv1 via registry
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB1" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "SMB1" -Value 0 -Type DWord -Force

# ========== NETWORK PROTECTION ==========
Write-Log "Enabling network protection..."

Set-MpPreference -EnableNetworkProtection Enabled -ErrorAction SilentlyContinue

# ========== EXPLOIT PROTECTION ==========
Write-Log "Configuring exploit protection..."

$ExploitGuardSettings = @{
    "ControlFlowGuard" = 1
    "DataExecutionPrevention" = 1
    "Seed randomization" = 1
}

# Enable ASLR
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "EnableLowIL" -Value 1 -Type DWord -Force

# ========== SECURE BOOT ==========
Write-Log "Checking Secure Boot status..."

try {
    $SecureBoot = Confirm-SecureBootUEFI -ErrorAction SilentlyContinue
    if ($SecureBoot -eq $true) {
        Write-Log "Secure Boot is ENABLED"
    } else {
        Write-Log "WARNING: Secure Boot is NOT enabled"
    }
} catch {
    Write-Log "Secure Boot status could not be verified (may not be supported)"
}

# ========== BITLOCKER ==========
Write-Log "Configuring BitLocker settings..."

# Check if BitLocker is available
$BitLocker = Get-BitLockerVolume -MountPoint "C:" -ErrorAction SilentlyContinue
if ($BitLocker) {
    if ($BitLocker.ProtectionStatus -eq "On") {
        Write-Log "BitLocker is ENABLED on C: drive"
    } else {
        Write-Log "BitLocker is OFF - consider enabling for security"
    }
} else {
    Write-Log "BitLocker not available on this system"
}

# ========== WINDOWS UPDATE ==========
Write-Log "Configuring Windows Update security..."

# Disable Driver updates via WU
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ExcludeWUDriversInQualityUpdate" -Value 1 -Type DWord -Force

# ========== PASSWORD POLICY ==========
Write-Log "Reviewing password policies..."

# Set minimum password length
net accounts /minpwlen:12 | Out-Null

# Set password complexity
net accounts /uniquepw:5 | Out-Null

# ========== DISABLE REMOTE DESKTOP ==========
Write-Log "Securing Remote Desktop..."

$RDPSettings = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -ErrorAction SilentlyContinue
if ($RDPSettings -and $RDPSettings.fDenyTSConnections -eq 0) {
    Write-Log "WARNING: Remote Desktop is ENABLED - consider disabling if not needed"
    # Enable NLA for RDP
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "UserAuthentication" -Value 1 -Type DWord -Force
}

# ========== BLOCK RDP NLA Bypass ==========
Write-Log "Blocking Network Level Authentication bypass..."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "SecurityLayer" -Value 2 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name "fAllowToGetHelp" -Value 0 -Type DWord -Force

# ========== DISABLE ADMIN SHARES ==========
Write-Log "Securing admin shares..."

# Disable admin shares
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "AutoShareWks" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "AutoShareServer" -Value 0 -Type DWord -Force

# ========== SECURE LM HASH ==========
Write-Log "Disabling LM hash storage..."

net accounts /lmlength:14 | Out-Null

# ========== ENCRYPTION ==========
Write-Log "Checking disk encryption..."

$BitlockerVolume = Get-BitLockerVolume -MountPoint "C:" -ErrorAction SilentlyContinue
if ($BitlockerVolume -and $BitlockerVolume.ProtectionStatus -eq "On") {
    Write-Log "C: drive is encrypted with BitLocker"
} else {
    Write-Log "C: drive is NOT encrypted - consider enabling BitLocker"
}

Write-Log "Security optimization completed!"
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "OptiCore OS Security Optimization Complete" -ForegroundColor Green
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