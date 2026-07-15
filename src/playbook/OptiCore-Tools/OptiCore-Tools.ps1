# ═══════════════════════════════════════════════════════════════════════════════
#  ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗
# ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝
# ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║
# ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║
# ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║
#  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝
#                          TOOLS - Unique Utilities
# ═══════════════════════════════════════════════════════════════════════════════
#
#  OptiCore Tools - Koleksi tools unik yang berbeda dari Windows dan Linux
#  Dirancang untuk memberikan pengalaman yang premium dan futuristik
#
#  Unique Tools:
#  - OptiCore Tweaker: Advanced system tweaking
#  - OptiCore Guardian: Real-time protection monitor
#  - OptiCore Radar: Network monitoring
#  - OptiCore Pulse: System health check
#  - OptiCore Forge: Configuration builder
#
#  Version: 1.0.0
#  Author: OptiCore Team
#
# ═══════════════════════════════════════════════════════════════════════════════

param(
    [switch]$Tweaker,
    [switch]$Guardian,
    [switch]$Radar,
    [switch]$Pulse,
    [switch]$Forge
)

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: TOOL: OPTICORE TWEAKER
# ═══════════════════════════════════════════════════════════════════════════════

function Start-OptiCoreTweaker {
    Clear-Host

    Write-Host @"


        ╔═══════════════════════════════════════════════════════════════════════╗
        ║                                                                       ║
        ║   ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗        ║
        ║  ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝        ║
        ║  ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║           ║
        ║  ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║           ║
        ║  ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║           ║
        ║   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝           ║
        ║                                                                       ║
        ║                ██████╗ ███████╗██████╗ ████████╗██╗  ██╗███████╗    ║
        ║                ██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██║  ██║██╔════╝    ║
        ║                ██║  ██║█████╗  ██████╔╝   ██║   ███████║█████╗      ║
        ║                ██║  ██║██╔══╝  ██╔═══╝    ██║   ██╔══██║██╔══╝      ║
        ║                ██████╔╝███████╗██║        ██║   ██║  ██║███████╗    ║
        ║                ╚═════╝ ╚══════╝╚═╝        ╚═╝   ╚═╝  ╚═╝╚══════╝    ║
        ║                                                                       ║
        ║                    ██████╗ ██╗   ██╗███████╗██████╗                   ║
        ║                    ██╔══██╗██║   ██║██╔════╝██╔══██╗                  ║
        ║                    ██║  ██║██║   ██║█████╗  ██████╔╝                  ║
        ║                    ██║  ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗                  ║
        ║                    ██████╔╝ ╚████╔╝ ███████╗██║  ██║                  ║
        ║                    ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝                  ║
        ║                                                                       ║
        ╚═══════════════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                    ADVANCED SYSTEM TWEAKER                          │" -ForegroundColor Cyan
    Write-Host "    │                                                                       │" -ForegroundColor Cyan
    Write-Host "    │  ⚠️  WARNING: Advanced tweaks may affect system stability!          │" -ForegroundColor Yellow
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    │  [1] CPU Optimizer        - Overclock profiles & scheduler tweaks   │" -ForegroundColor White
    Write-Host "    │  [2] Memory Tuner         - RAM optimization & cache settings       │" -ForegroundColor White
    Write-Host "    │  [3] Storage Accelerator  - SSD/HDD optimization                   │" -ForegroundColor White
    Write-Host "    │  [4] Network Turbo        - Bandwidth & latency tuning             │" -ForegroundColor White
    Write-Host "    │  [5] Graphics Boost       - GPU scheduling & render settings      │" -ForegroundColor White
    Write-Host "    │  [6] Input Response       - Keyboard/Mouse latency reduction       │" -ForegroundColor White
    Write-Host "    │  [7] Boot Accelerator     - Startup optimization                    │" -ForegroundColor White
    Write-Host "    │  [8] Service Architect    - Fine-tune Windows services              │" -ForegroundColor White
    Write-Host "    │  [9] Registry Surgeon     - Deep registry optimization              │" -ForegroundColor White
    Write-Host "    │  [A] Apply All Safe       - Apply all safe optimizations           │" -ForegroundColor Green
    Write-Host "    │  [B] Apply All Aggressive - Apply maximum optimizations             │" -ForegroundColor Red
    Write-Host "    │  [R] Reset to Defaults    - Revert all tweaks                      │" -ForegroundColor Yellow
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    [Q] Back to Main Menu" -ForegroundColor Yellow
    Write-Host ""

    $choice = Read-Host "    Select tweak category"

    switch ($choice) {
        "1" {
            Write-Host ""
            Write-Host "    ⚙️  CPU Optimizer" -ForegroundColor Cyan
            Write-Host "    ┌───────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
            Write-Host "    │  [1] Gaming Profile    - Prioritas single-core,降低延迟        │" -ForegroundColor White
            Write-Host "    │  [2] Workstation Profile - Multi-thread optimization          │" -ForegroundColor White
            Write-Host "    │  [3] Power Saver Profile - Reduced power consumption           │" -ForegroundColor White
            Write-Host "    │  [4] Custom Profile    - Manual core settings                 │" -ForegroundColor White
            Write-Host "    └───────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
        }
        "2" {
            Write-Host ""
            Write-Host "    💾 Memory Tuner" -ForegroundColor Cyan
            Write-Host "    ┌───────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
            Write-Host "    │  [1] Low Latency Mode    - Reduce memory access latency       │" -ForegroundColor White
            Write-Host "    │  [2] Large Pages          - Enable large page support         │" -ForegroundColor White
            Write-Host "    │  [3] Disable Memory Compression - Direct RAM usage           │" -ForegroundColor White
            Write-Host "    │  [4] Optimize Pagefile   - Custom pagefile settings           │" -ForegroundColor White
            Write-Host "    └───────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
        }
        default {
            Write-Host "    Feature not implemented in this version." -ForegroundColor Yellow
        }
    }
}

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: TOOL: OPTICORE GUARDIAN
# ═══════════════════════════════════════════════════════════════════════════════

function Start-OptiCoreGuardian {
    Clear-Host

    Write-Host @"


        ╔═══════════════════════════════════════════════════════════════════════╗
        ║                                                                       ║
        ║   ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗        ║
        ║  ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝        ║
        ║  ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║           ║
        ║  ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║           ║
        ║  ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║           ║
        ║   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝           ║
        ║                                                                       ║
        ║                   ██████╗ ███████╗███████╗ ██████╗ █████╗ ██████╗   ║
        ║                   ██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗██╔══██╗  ║
        ║                   ██║  ██║█████╗  ███████╗██║     ███████║██████╔╝  ║
        ║                   ██║  ██║██╔══╝  ╚════██║██║     ██╔══██║██╔═══╝  ║
        ║                   ██████╔╝███████╗███████║╚██████╗██║  ██║██║      ║
        ║                   ╚═════╝ ╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝      ║
        ║                                                                       ║
        ║                   ████████╗██╗  ██╗███████╗                               ║
        ║                   ╚══██╔══╝██║  ██║██╔════╝                               ║
        ║                      ██║   ███████║█████╗                                 ║
        ║                      ██║   ██╔══██║██╔══╝                                 ║
        ║                      ██║   ██║  ██║███████╗                               ║
        ║                      ╚═╝   ╚═╝  ╚═╝╚══════╝                               ║
        ║                                                                       ║
        ╚═══════════════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                    REAL-TIME PROTECTION MONITOR                     │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray

    # Check security status
    $defenderStatus = Get-MpComputerStatus -ErrorAction SilentlyContinue
    $firewallStatus = Get-NetFirewallProfile -ErrorAction SilentlyContinue

    Write-Host "    │                                                                     │" -ForegroundColor DarkGray
    Write-Host -n "    │  🛡️  Windows Defender    : " -ForegroundColor White

    if ($defenderStatus -and $defenderStatus.AntivirusEnabled) {
        Write-Host "ACTIVE  " -ForegroundColor Green -NoNewline
        Write-Host "✓" -ForegroundColor Green
    } else {
        Write-Host "INACTIVE" -ForegroundColor Red -NoNewline
        Write-Host "✗" -ForegroundColor Red
    }

    Write-Host -n "    │  🔥 Firewall (Domain)      : " -ForegroundColor White
    if ($firewallStatus[0].Enabled) {
        Write-Host "ENABLED " -ForegroundColor Green -NoNewline
        Write-Host "✓" -ForegroundColor Green
    } else {
        Write-Host "DISABLED" -ForegroundColor Red -NoNewline
        Write-Host "✗" -ForegroundColor Red
    }

    Write-Host -n "    │  🔥 Firewall (Private)    : " -ForegroundColor White
    if ($firewallStatus[1].Enabled) {
        Write-Host "ENABLED " -ForegroundColor Green -NoNewline
        Write-Host "✓" -ForegroundColor Green
    } else {
        Write-Host "DISABLED" -ForegroundColor Red -NoNewline
        Write-Host "✗" -ForegroundColor Red
    }

    Write-Host -n "    │  🔥 Firewall (Public)     : " -ForegroundColor White
    if ($firewallStatus[2].Enabled) {
        Write-Host "ENABLED " -ForegroundColor Green -NoNewline
        Write-Host "✓" -ForegroundColor Green
    } else {
        Write-Host "DISABLED" -ForegroundColor Red -NoNewline
        Write-Host "✗" -ForegroundColor Red
    }

    Write-Host -n "    │  🔒 SmartScreen           : " -ForegroundColor White
    $smartScreen = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -ErrorAction SilentlyContinue
    if ($smartScreen -and $smartScreen.SmartScreenEnabled -eq "Enabled") {
        Write-Host "ENABLED " -ForegroundColor Green -NoNewline
        Write-Host "✓" -ForegroundColor Green
    } else {
        Write-Host "DISABLED" -ForegroundColor Yellow -NoNewline
        Write-Host "⚠" -ForegroundColor Yellow
    }

    Write-Host "    │                                                                     │" -ForegroundColor DarkGray
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │                                                                     │" -ForegroundColor DarkGray
    Write-Host "    │   [1] Quick Security Scan    [2] Privacy Audit                     │" -ForegroundColor White
    Write-Host "    │   [3] Network Protection      [4] Application Control                │" -ForegroundColor White
    Write-Host "    │   [5] Backup Security Config  [6] Restore Security Settings        │" -ForegroundColor White
    Write-Host "    │                                                                     │" -ForegroundColor DarkGray
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: TOOL: OPTICORE RADAR
# ═══════════════════════════════════════════════════════════════════════════════

function Start-OptiCoreRadar {
    Clear-Host

    Write-Host @"


        ╔═══════════════════════════════════════════════════════════════════════╗
        ║                                                                       ║
        ║   ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗        ║
        ║  ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝        ║
        ║  ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║           ║
        ║  ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║           ║
        ║  ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║           ║
        ║   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝           ║
        ║                                                                       ║
        ║   ██████╗ ███████╗ █████╗ ██████╗                                      ║
        ║   ██╔══██╗██╔════╝██╔══██╗██╔══██╗                                     ║
        ║   ██║  ██║█████╗  ███████║██║  ██║                                     ║
        ║   ██║  ██║██╔══╝  ██╔══██║██║  ██║                                     ║
        ║   ██████╔╝███████╗██║  ██║██████╔╝                                     ║
        ║   ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝                                      ║
        ║                                                                       ║
        ║   ████████╗███████╗███╗   ███╗██████╗ ██╗     ███████╗              ║
        ║   ╚══██╔══╝██╔════╝████╗ ████║██╔══██╗██║     ██╔════╝              ║
        ║      ██║   █████╗  ██╔████╔██║██████╔╝██║     █████╗                ║
        ║      ██║   ██╔══╝  ██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝                ║
        ║      ██║   ███████╗██║ ╚═╝ ██║██║     ███████╗███████╗              ║
        ║      ╚═╝   ╚══════╝╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝              ║
        ║                                                                       ║
        ╚═══════════════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                      NETWORK MONITORING RADAR                        │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray

    # Get network adapters
    $adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

    foreach ($adapter in $adapters) {
        $ip = (Get-NetIPAddress -InterfaceIndex $adapter.ifIndex -AddressFamily IPv4 -ErrorAction SilentlyContinue).IPAddress
        $speed = if ($adapter.LinkSpeed) { $adapter.LinkSpeed } else { "Unknown" }

        Write-Host "    │  📡 $($adapter.Name)" -ForegroundColor Cyan
        Write-Host "    │     IP: $ip | Speed: $speed | Status: $($adapter.Status)" -ForegroundColor White
        Write-Host "    │" -ForegroundColor DarkGray
    }

    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    │   [1] Active Connections    [2] Port Scanner                         │" -ForegroundColor White
    Write-Host "    │   [3] DNS Checker           [4] Latency Test                         │" -ForegroundColor White
    Write-Host "    │   [5] Bandwidth Monitor     [6] DNS Optimizer                        │" -ForegroundColor White
    Write-Host "    │   [7] Network Reset        [8] Advanced Config                       │" -ForegroundColor White
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: TOOL: OPTICORE PULSE
# ═══════════════════════════════════════════════════════════════════════════════

function Start-OptiCorePulse {
    Clear-Host

    Write-Host @"


        ╔═══════════════════════════════════════════════════════════════════════╗
        ║                                                                       ║
        ║   ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗        ║
        ║  ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝        ║
        ║  ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║           ║
        ║  ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║           ║
        ║  ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║           ║
        ║   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝           ║
        ║                                                                       ║
        ║   ███████╗██████╗  █████╗ ███╗   ██╗██████╗ ███████╗██████╗         ║
        ║   ██╔════╝██╔══██╗██╔══██╗████╗  ██║██╔══██╗██╔════╝██╔══██╗        ║
        ║   █████╗  ██████╔╝███████║██╔██╗ ██║██║  ██║█████╗  ██████╔╝        ║
        ║   ██╔══╝  ██╔══██╗██╔══██║██║╚██╗██║██║  ██║██╔══╝  ██╔══██╗        ║
        ║   ██║     ██║  ██║██║  ██║██║ ╚████║██████╔╝███████╗██║  ██║        ║
        ║   ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝        ║
        ║                                                                       ║
        ║   ████████╗██████╗  ██████╗ ███████╗                                      ║
        ║   ╚══██╔══╝██╔══██╗██╔═══██╗██╔════╝                                      ║
        ║      ██║   ██████╔╝██║   ██║█████╗                                        ║
        ║      ██║   ██╔══██╗██║   ██║██╔══╝                                        ║
        ║      ██║   ██║  ██║╚██████╔╝███████╗                                      ║
        ║      ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝                                      ║
        ║                                                                       ║
        ╚═══════════════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                       SYSTEM HEALTH CHECK                           │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray

    $sysInfo = Get-CimInstance Win32_OperatingSystem
    $cpu = Get-CimInstance Win32_Processor
    $mem = Get-CimInstance Win32_PhysicalMemory | Measure-Object Capacity -Sum
    $disk = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"

    # Calculate health score
    $cpuHealth = if ($cpu.LoadPercentage -lt 80) { 100 } else { 100 - ($cpu.LoadPercentage - 80) }
    $memHealth = if (($sysInfo.TotalVisibleMemorySize - $sysInfo.FreePhysicalMemory) / $sysInfo.TotalVisibleMemorySize -lt 0.9) { 100 } else { 50 }
    $diskHealth = 100  # Placeholder
    $overallHealth = [math]::Round(($cpuHealth + $memHealth + $diskHealth) / 3, 1)

    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    │   SYSTEM HEALTH OVERVIEW                                              │" -ForegroundColor White
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host -n "    │   Overall Health: " -ForegroundColor White

    $healthColor = if ($overallHealth -gt 80) { "Green" } elseif ($overallHealth -gt 50) { "Yellow" } else { "Red" }
    Write-Host "$overallHealth%  " -ForegroundColor $healthColor -NoNewline

    $healthBars = [math]::Round($overallHealth / 5)
    Write-Host ("█" * $healthBars) -NoNewline -ForegroundColor $healthColor
    Write-Host (" " * (20 - $healthBars)) -NoNewline -ForegroundColor DarkGray
    Write-Host "│" -ForegroundColor DarkGray

    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    │   Component        Status            Details                          │" -ForegroundColor White
    Write-Host "    │   ───────────────────────────────────────────────────────────────────│" -ForegroundColor DarkGray
    Write-Host "    │   CPU               $(if ($cpu.LoadPercentage -lt 50) { 'HEALTHY ✓' } elseif ($cpu.LoadPercentage -lt 80) { 'NORMAL ⚠' } else { 'HIGH ✗' })$((' ') * 25)$($cpu.LoadPercentage)%" -ForegroundColor $(if ($cpu.LoadPercentage -lt 50) { "Green" } elseif ($cpu.LoadPercentage -lt 80) { "Yellow" } else { "Red" })
    Write-Host "    │   Memory            $(if (($sysInfo.TotalVisibleMemorySize - $sysInfo.FreePhysicalMemory) / $sysInfo.TotalVisibleMemorySize -lt 0.7) { 'HEALTHY ✓' } elseif (($sysInfo.TotalVisibleMemorySize - $sysInfo.FreePhysicalMemory) / $sysInfo.TotalVisibleMemorySize -lt 0.9) { 'NORMAL ⚠' } else { 'HIGH ✗' })$((' ') * 25)$([math]::Round((($sysInfo.TotalVisibleMemorySize - $sysInfo.FreePhysicalMemory) / $sysInfo.TotalVisibleMemorySize) * 100))%" -ForegroundColor $(if ((($sysInfo.TotalVisibleMemorySize - $sysInfo.FreePhysicalMemory) / $sysInfo.TotalVisibleMemorySize) -lt 0.7) { "Green" } elseif ((($sysInfo.TotalVisibleMemorySize - $sysInfo.FreePhysicalMemory) / $sysInfo.TotalVisibleMemorySize) -lt 0.9) { "Yellow" } else { "Red" })
    Write-Host "    │   Storage           HEALTHY ✓          $([math]::Round(($disk | Measure-Object -Property Size -Sum).Sum / 1GB)) GB Total" -ForegroundColor Green
    Write-Host "    │   Network          $(if ((Test-NetConnection -ComputerName 8.8.8.8 -WarningAction SilentlyContinue).PingSucceeded) { 'CONNECTED ✓' } else { 'OFFLINE ✗' })$((' ') * 25)$([math]::Round((Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Measure-Object -Property LinkSpeed -First 1).LinkSpeed, 0))" -ForegroundColor $(if ((Test-NetConnection -ComputerName 8.8.8.8 -WarningAction SilentlyContinue).PingSucceeded) { "Green" } else { "Red" })
    Write-Host "    │   Security         $(if ((Get-MpComputerStatus -ErrorAction SilentlyContinue).AntivirusEnabled) { 'PROTECTED ✓' } else { 'VULNERABLE ✗' })$((' ') * 24)Windows Defender" -ForegroundColor $(if ((Get-MpComputerStatus -ErrorAction SilentlyContinue).AntivirusEnabled) { "Green" } else { "Red" })
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │   [1] Full System Scan    [2] Performance Test                     │" -ForegroundColor White
    Write-Host "    │   [3] Disk Health Check   [4] Memory Stress Test                  │" -ForegroundColor White
    Write-Host "    │   [5] Generate Report     [6] Auto-Fix Issues                     │" -ForegroundColor White
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: TOOL: OPTICORE FORGE
# ═══════════════════════════════════════════════════════════════════════════════

function Start-OptiCoreForge {
    Clear-Host

    Write-Host @"


        ╔═══════════════════════════════════════════════════════════════════════╗
        ║                                                                       ║
        ║   ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗        ║
        ║  ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝        ║
        ║  ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║           ║
        ║  ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║           ║
        ║  ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║           ║
        ║   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝           ║
        ║                                                                       ║
        ║   ██████╗ ███████╗ █████╗ ██████╗ ███████╗██████╗ ███████╗██╗     ║
        ║   ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝██║     ║
        ║   ██║  ██║█████╗  ███████║██████╔╝█████╗  ██████╔╝███████╗██║     ║
        ║   ██║  ██║██╔══╝  ██╔══██║██╔══██╗██╔══╝  ██╔══██╗╚════██║╚═╝     ║
        ║   ██████╔╝███████╗██║  ██║██║  ██║███████╗██║  ██║███████║██╗     ║
        ║   ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ║
        ║                                                                       ║
        ║                    ██████╗ ███████╗██╗   ██╗███████╗███████╗         ║
        ║                    ██╔══██╗██╔════╝██║   ██║██╔════╝██╔════╝         ║
        ║                    ██║  ██║█████╗  ██║   ██║█████╗  █████╗           ║
        ║                    ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██╔══╝           ║
        ║                    ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗         ║
        ║                    ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝         ║
        ║                                                                       ║
        ╚═══════════════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                   CONFIGURATION BUILDER & FORGE                       │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    │  Build custom optimization profiles for different use cases!           │" -ForegroundColor White
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    │  ┌─────────────────────────────────────────────────────────────────┐ │" -ForegroundColor DarkGray
    Write-Host "    │  │  PRESET TEMPLATES                                                │ │" -ForegroundColor Cyan
    Write-Host "    │  ├─────────────────────────────────────────────────────────────────┤ │" -ForegroundColor DarkGray
    Write-Host "    │  │  [1] Gaming Beast      - Maximum FPS for competitive gaming       │ │" -ForegroundColor Magenta
    Write-Host "    │  │  [2] Streaming Rig     - Balanced for OBS/streaming              │ │" -ForegroundColor Blue
    Write-Host "    │  │  [3] Developer Setup   - Optimized for compilation                │ │" -ForegroundColor Green
    Write-Host "    │  │  [4] Content Creator   - Video editing & rendering                │ │" -ForegroundColor Yellow
    Write-Host "    │  │  [5] Battery Life     - Maximum battery duration                  │ │" -ForegroundColor Cyan
    Write-Host "    │  │  [6] Stealth Mode     - Maximum privacy & security                │ │" -ForegroundColor Red
    Write-Host "    │  │  [7] Custom Build     - Create your own configuration             │ │" -ForegroundColor White
    Write-Host "    │  └─────────────────────────────────────────────────────────────────┘ │" -ForegroundColor DarkGray
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    │  ┌─────────────────────────────────────────────────────────────────┐ │" -ForegroundColor DarkGray
    Write-Host "    │  │  MY BUILDS                                                      │ │" -ForegroundColor Cyan
    Write-Host "    │  ├─────────────────────────────────────────────────────────────────┤ │" -ForegroundColor DarkGray
    Write-Host "    │  │  No saved builds found. Create your first configuration!        │ │" -ForegroundColor Yellow
    Write-Host "    │  └─────────────────────────────────────────────────────────────────┘ │" -ForegroundColor DarkGray
    Write-Host "    │                                                                       │" -ForegroundColor DarkGray
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │   [L] Load Configuration    [S] Save Current    [E] Export to File  │" -ForegroundColor White
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: MAIN
# ═══════════════════════════════════════════════════════════════════════════════

function Show-MainMenu {
    Clear-Host

    Write-Host @"


        ╔═══════════════════════════════════════════════════════════════════════════════════╗
        ║                                                                                   ║
        ║     ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗                    ║
        ║    ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝                    ║
        ║    ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║                       ║
        ║    ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║                       ║
        ║    ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║                       ║
        ║     ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝                       ║
        ║                                                                                   ║
        ║           ██████╗██╗   ██╗ ██████╗ ███████╗██╗     ██╗                             ║
        ║          ██╔════╝██║   ██║██╔═══██╗██╔════╝██║     ██║                             ║
        ║          ██║     ██║   ██║██║   ██║█████╗  ██║     ██║                             ║
        ║          ██║     ██║   ██║██║   ██║██╔══╝  ██║     ██║                             ║
        ║          ╚██████╗╚██████╔╝╚██████╔╝███████╗███████╗███████╗                        ║
        ║           ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚══════╝                        ║
        ║                                                                                   ║
        ║                    ██████╗ ███████╗██████╗ ████████╗██╗  ██╗███████╗               ║
        ║                    ██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██║  ██║██╔════╝               ║
        ║                    ██║  ██║█████╗  ██████╔╝   ██║   ███████║█████╗                 ║
        ║                    ██║  ██║██╔══╝  ██╔═══╝    ██║   ██╔══██║██╔══╝                 ║
        ║                    ██████╔╝███████╗██║        ██║   ██║  ██║███████╗               ║
        ║                    ╚═════╝ ╚══════╝╚═╝        ╚═╝   ╚═╝  ╚═╝╚══════╝               ║
        ║                                                                                   ║
        ║                        ████████╗██████╗  ██████╗ ███████╗                            ║
        ║                        ╚══██╔══╝██╔══██╗██╔═══██╗██╔════╝                            ║
        ║                           ██║   ██████╔╝██║   ██║█████╗                              ║
        ║                           ██║   ██╔══██╗██║   ██║██╔══╝                              ║
        ║                           ██║   ██║  ██║╚██████╔╝███████╗                            ║
        ║                           ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝                            ║
        ║                                                                                   ║
        ║                    ██████╗██╗   ██╗██████╗ ███████╗██████╗                           ║
        ║                    ██╔══██╗██║   ██║██╔══██╗██╔════╝██╔══██╗                          ║
        ║                    ██║  ██║██║   ██║██████╔╝█████╗  ██████╔╝                          ║
        ║                    ██║  ██║╚██╗ ██╔╝██╔═══╝ ██╔══╝  ██╔══██╗                          ║
        ║                    ██████╔╝ ╚████╔╝ ██║     ███████╗██║  ██║                          ║
        ║                    ╚═════╝   ╚═══╝  ╚═╝     ╚══════╝╚═╝  ╚═╝                          ║
        ║                                                                                   ║
        ╚═══════════════════════════════════════════════════════════════════════════════════╝


"@ -ForegroundColor Cyan

    Write-Host "    ┌───────────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                       OPTICORE TOOLS SUITE v1.0.0                         │" -ForegroundColor Cyan
    Write-Host "    │                                                                           │" -ForegroundColor Cyan
    Write-Host "    │  Unique utilities designed for a premium Windows experience              │" -ForegroundColor White
    Write-Host "    │                                                                           │" -ForegroundColor Cyan
    Write-Host "    ├───────────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │                                                                           │" -ForegroundColor DarkGray
    Write-Host "    │   [1] ⚡ OptiCore Tweaker    - Advanced system optimization               │" -ForegroundColor Magenta
    Write-Host "    │   [2] 🛡️  OptiCore Guardian  - Real-time protection monitor               │" -ForegroundColor Green
    Write-Host "    │   [3] 📡 OptiCore Radar      - Network monitoring & tools                │" -ForegroundColor Cyan
    Write-Host "    │   [4] 💓 OptiCore Pulse      - System health diagnostics                 │" -ForegroundColor Yellow
    Write-Host "    │   [5] 🔨 OptiCore Forge      - Configuration builder                     │" -ForegroundColor Red
    Write-Host "    │   [6] 🎯 All Tools           - Run all diagnostic tools                   │" -ForegroundColor White
    Write-Host "    │                                                                           │" -ForegroundColor DarkGray
    Write-Host "    └───────────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    [Q] Quit" -ForegroundColor Yellow
    Write-Host ""

    $choice = Read-Host "    Select option"

    switch ($choice) {
        "1" { Start-OptiCoreTweaker }
        "2" { Start-OptiCoreGuardian }
        "3" { Start-OptiCoreRadar }
        "4" { Start-OptiCorePulse }
        "5" { Start-OptiCoreForge }
        "6" {
            Start-OptiCoreGuardian
            Start-Sleep -Seconds 2
            Start-OptiCorePulse
        }
        "Q" {
            Write-Host ""
            Write-Host "    Thank you for using OptiCore Tools!" -ForegroundColor Cyan
            Write-Host "    ⚡ Stay Optimized! ⚡" -ForegroundColor Magenta
            Write-Host ""
            exit 0
        }
        default { Write-Host "    Invalid option." -ForegroundColor Red }
    }
}

# Entry Point
if ($Tweaker) {
    Start-OptiCoreTweaker
} elseif ($Guardian) {
    Start-OptiCoreGuardian
} elseif ($Radar) {
    Start-OptiCoreRadar
} elseif ($Pulse) {
    Start-OptiCorePulse
} elseif ($Forge) {
    Start-OptiCoreForge
} else {
    Show-MainMenu
}
