# ==========================================
# OptiCore OS - Network Optimization Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Network and DNS optimizations for lower latency

param(
    [switch]$Silent,
    [switch]$NoReboot
)

$ErrorActionPreference = "Continue"
$LogFile = "$env:TEMP\OptiCore_Network_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-Log {
    param([string]$Message)
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogMessage = "[$Timestamp] $Message"
    Add-Content -Path $LogFile -Value $LogMessage
    if (-not $Silent) { Write-Host $Message }
}

Write-Log "OptiCore OS - Network Optimization Started"

# ========== ELEVATION CHECK ==========
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Log "ERROR: Administrator privileges required"
    Write-Host "Please run as Administrator" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🌐 OptiCore OS - Network Optimization" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# ========== TCP PARAMETERS ==========
Write-Log "Optimizing TCP parameters..."

$tcpParams = @{
    "TcpAckFrequency" = 1
    "TCPNoDelay" = 1
    "TcpTimedWaitDelay" = 30
    "TcpMaxDataRetransmissions" = 3
    "DefaultTTL" = 64
    "KeepAliveTime" = 300000
    "KeepAliveInterval" = 1000
}

foreach ($param in $tcpParams.GetEnumerator()) {
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name $param.Key -Value $param.Value -Type DWord -Force
    Write-Log "Set $($param.Key) = $($param.Value)"
}

# ========== NETWORK BUFFER ==========
Write-Log "Optimizing network buffer sizes..."

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultReceiveWindow" -Value 1048576 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultSendWindow" -Value 1048576 -Type DWord -Force

# ========== NIC TUNING ==========
Write-Log "Optimizing network adapter settings..."

$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
foreach ($adapter in $adapters) {
    Write-Log "Configuring adapter: $($adapter.Name)"
    
    try {
        # Enable RSS
        Set-NetAdapterRss -Name $adapter.Name -Enabled $true -ErrorAction SilentlyContinue
        
        # Set interrupt moderation
        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Interrupt Moderation" -DisplayValue "Off" -ErrorAction SilentlyContinue
    } catch {
        Write-Log "Could not configure: $($adapter.Name)"
    }
}

# ========== DNS OPTIMIZATION ==========
Write-Log "Optimizing DNS settings..."

# Set DNS servers (Google DNS)
$dnsServers = @("8.8.8.8", "8.8.4.4", "1.1.1.1", "1.0.0.1")

foreach ($adapter in $adapters) {
    try {
        Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses $dnsServers -ErrorAction SilentlyContinue
        Write-Log "DNS set for: $($adapter.Name)"
    } catch {
        Write-Log "Could not set DNS for: $($adapter.Name)"
    }
}

# ========== DISABLE NETBIOS ==========
Write-Log "Disabling NetBIOS over TCP/IP..."

$adaptersConfig = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }
foreach ($adapterConfig in $adaptersConfig) {
    $adapterConfig.SetTcpipNetbios(2) | Out-Null
    Write-Log "NetBIOS disabled for: $($adapterConfig.Description)"
}

# ========== DISABLE LLDP ==========
Write-Log "Disabling LLDP..."

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "EnableLldp" -Value 0 -Type DWord -Force

# ========== NETWORK THROTTLING ==========
Write-Log "Disabling network throttling..."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -Type DWord -Force

# ========== QoS SETTINGS ==========
Write-Log "Configuring QoS settings..."

# Reserve bandwidth for system
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkServiceBandwidth" -Value 0xFFFFFFFF -Type DWord -Force

# ========== SMB OPTIMIZATION ==========
Write-Log "Optimizing SMB settings..."

# Enable SMB Direct
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB2" -Value 1 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB1" -Value 0 -Type DWord -Force

# ========== DISABLE AUTO TUNING ==========
Write-Log "Configuring Auto-Tuning level..."

try {
    netsh int tcp set global autotuninglevel=normal | Out-Null
    Write-Log "Auto-Tuning set to normal"
} catch {
    Write-Log "Could not set Auto-Tuning"
}

# ========== RSS SETTINGS ==========
Write-Log "Configuring RSS settings..."

try {
    netsh int tcp set global rss=enabled | Out-Null
    netsh int tcp set global chimney=enabled | Out-Null
    netsh int tcp set global timestamps=disabled | Out-Null
    Write-Log "RSS and Chimney enabled"
} catch {
    Write-Log "Could not configure RSS"
}

# ========== CONNECTIONS ==========
Write-Log "Optimizing connection settings..."

try {
    netsh int tcp set global dca=enabled | Out-Null
    netsh int tcp set global netdma=enabled | Out-Null
    netsh int tcp set global congestionprovider=ctcp | Out-Null
    Write-Log "Connection optimizations applied"
} catch {
    Write-Log "Could not apply connection optimizations"
}

# ========== FLUSH DNS ==========
Write-Log "Flushing DNS cache..."

ipconfig /flushdns | Out-Null
Write-Log "DNS cache flushed"

# ========== RESET WINSOCK ==========
Write-Log "Resetting Winsock catalog..."

netsh winsock reset | Out-Null
Write-Log "Winsock reset complete"

# ========== DISABLE NAGLE ==========
Write-Log "Disabling Nagle algorithm..."

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" -Name "TcpAckFrequency" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue

# ========== NETWORK ADAPTER ADVANCED ==========
Write-Log "Optimizing adapter advanced properties..."

$adapters | ForEach-Object {
    try {
        # Speed & Duplex
        Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName "Speed & Duplex" -DisplayValue "Auto" -ErrorAction SilentlyContinue
        
        # Energy Efficient Ethernet
        Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName "Energy Efficient Ethernet" -DisplayValue "Off" -ErrorAction SilentlyContinue
        
        # Flow Control
        Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName "Flow Control" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
        
        # Power Saving
        Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName "Power Saving Mode" -DisplayValue "Off" -ErrorAction SilentlyContinue
    } catch { }
}

Write-Log "Adapter advanced properties optimized"

# ========== FINAL REPORT ==========
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "🌐 Network Optimization Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Optimizations Applied:" -ForegroundColor Yellow
Write-Host "  ✅ TCP Parameters Optimized" -ForegroundColor White
Write-Host "  ✅ Network Buffer Increased" -ForegroundColor White
Write-Host "  ✅ RSS Enabled" -ForegroundColor White
Write-Host "  ✅ DNS Set to Google/Cloudflare" -ForegroundColor White
Write-Host "  ✅ NetBIOS Disabled" -ForegroundColor White
Write-Host "  ✅ Network Throttling Disabled" -ForegroundColor White
Write-Host "  ✅ SMB2 Enabled, SMB1 Disabled" -ForegroundColor White
Write-Host "  ✅ Auto-Tuning Normal" -ForegroundColor White
Write-Host "  ✅ RSS & Chimney Enabled" -ForegroundColor White
Write-Host "  ✅ DNS Cache Flushed" -ForegroundColor White
Write-Host "  ✅ Winsock Reset" -ForegroundColor White
Write-Host ""
Write-Host "Recommended: Reboot for full effect" -ForegroundColor Cyan
Write-Host ""
Write-Host "Log file: $LogFile" -ForegroundColor Cyan

if (-not $NoReboot) {
    Write-Host ""
    Write-Host "System reboot recommended for full effect." -ForegroundColor Yellow
    $reboot = Read-Host "Reboot now? (Y/N)"
    if ($reboot -eq "Y") { Restart-Computer -Force }
}

exit 0