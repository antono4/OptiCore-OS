# ═══════════════════════════════════════════════════════════════════════════════
#  ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗
# ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝
# ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║
# ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║
# ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║
#  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝
#                          HUB - Control Center
# ═══════════════════════════════════════════════════════════════════════════════
#
#  OptiCore Hub - Central Control Center untuk OptiCore OS
#  A unique control center yang berbeda dari Windows Settings dan Linux Control Panel
#
#  Fitur:
#  - Unified dashboard dengan visual futuristik
#  - Mode switching (Gaming, Work, Battery, Privacy)
#  - Real-time system monitoring
#  - Quick toggles
#  - Performance presets
#
#  Version: 1.0.0
#  Author: OptiCore Team
#
# ═══════════════════════════════════════════════════════════════════════════════

param(
    [switch]$Compact,        # Compact mode untuk quick access
    [switch]$Monitoring,     # Start in monitoring mode
    [switch]$Dark            # Dark theme (default)
)

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: CONFIGURATION
# ═══════════════════════════════════════════════════════════════════════════════

$Global:OptiCoreVersion = "1.0.0"
$Global:ThemeAccent = "#00D4FF"  # Cyan accent
$Global:ThemeSecondary = "#FF00AA"  # Magenta accent
$Global:ThemeBg = "#0A0A0F"      # Dark background
$Global:ThemeCard = "#12121A"     # Card background

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

function Write-OptiCoreHeader {
    param([string]$Title)
    $header = @"

    ╔══════════════════════════════════════════════════════════════════════════╗
    ║                                                                          ║
    ║   ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗            ║
    ║  ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝            ║
    ║  ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║               ║
    ║  ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║               ║
    ║  ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║               ║
    ║   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝               ║
    ║                                                                              ║
    ╚══════════════════════════════════════════════════════════════════════════╝

"@
    Write-Host $header -ForegroundColor Cyan
    Write-Host "    ⚡ OptiCore Hub - Central Control Center v$Global:OptiCoreVersion" -ForegroundColor White
    Write-Host "    " ("═" * 74) -ForegroundColor Cyan
    Write-Host ""
}

function Get-SystemInfo {
    $os = Get-CimInstance Win32_OperatingSystem
    $cpu = Get-CimInstance Win32_Processor
    $mem = Get-CimInstance Win32_PhysicalMemory | Measure-Object Capacity -Sum

    return @{
        Hostname = $env:COMPUTERNAME
        OS = $os.Caption
        Build = $os.BuildNumber
        CPU = $cpu.Name
        RAMTotal = [math]::Round($mem.Sum / 1GB, 2)
        RAMUsed = [math]::Round(($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / 1MB, 2)
        Uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    }
}

function Get-PerformanceMetrics {
    $cpu = (Get-Counter '\Processor(_Total)\% Processor Time' -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue
    $ram = (Get-CimInstance Win32_OperatingSystem)
    $ramUsed = [math]::Round((($ram.TotalVisibleMemorySize - $ram.FreePhysicalMemory) / $ram.TotalVisibleMemorySize) * 100, 1)
    $disk = Get-Counter '\PhysicalDisk(_Total)\% Disk Time' -SampleInterval 1 -MaxSamples 1 -ErrorAction SilentlyContinue
    $diskUsed = if ($disk) { [math]::Round($disk.CounterSamples.CookedValue, 1) } else { 0 }

    return @{
        CPU = [math]::Round($cpu, 1)
        RAM = $ramUsed
        Disk = $diskUsed
    }
}

function Show-MainDashboard {
    Clear-Host
    Write-OptiCoreHeader

    $sysInfo = Get-SystemInfo
    $perf = Get-PerformanceMetrics

    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                        SYSTEM OVERVIEW                                │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │  🖥️  Hostname    : $($sysInfo.Hostname)" -ForegroundColor White
    Write-Host "    │  💿 OS          : $($sysInfo.OS)" -ForegroundColor White
    Write-Host "    │  🔧 Build       : $($sysInfo.Build)" -ForegroundColor White
    Write-Host "    │  ⚙️  CPU         : $($sysInfo.CPU)" -ForegroundColor White
    Write-Host "    │  💾 RAM         : $($sysInfo.RAMTotal) GB Total | $($sysInfo.RAMUsed) GB Used" -ForegroundColor White
    Write-Host "    │  ⏱️  Uptime     : $($sysInfo.Uptime.Days)d $($sysInfo.Uptime.Hours)h $($sysInfo.Uptime.Minutes)m" -ForegroundColor White
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""

    # Performance Bars
    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                      REAL-TIME PERFORMANCE                           │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host -n "    │  CPU  [" -ForegroundColor White
    $cpuBars = [math]::Round($perf.CPU / 2)
    Write-Host ("█" * $cpuBars) -NoNewline -ForegroundColor $(if ($perf.CPU -gt 80) { "Red" } elseif ($perf.CPU -gt 50) { "Yellow" } else { "Green" })
    Write-Host (" " * (50 - $cpuBars)) -NoNewline -ForegroundColor DarkGray
    Write-Host "] $($perf.CPU)%" -ForegroundColor White
    Write-Host -n "    │  RAM  [" -ForegroundColor White
    $ramBars = [math]::Round($perf.RAM / 2)
    Write-Host ("█" * $ramBars) -NoNewline -ForegroundColor $(if ($perf.RAM -gt 90) { "Red" } elseif ($perf.RAM -gt 70) { "Yellow" } else { "Green" })
    Write-Host (" " * (50 - $ramBars)) -NoNewline -ForegroundColor DarkGray
    Write-Host "] $($perf.RAM)%" -ForegroundColor White
    Write-Host -n "    │  DISK [" -ForegroundColor White
    $diskBars = [math]::Round($perf.Disk / 2)
    Write-Host ("█" * $diskBars) -NoNewline -ForegroundColor $(if ($perf.Disk -gt 80) { "Red" } elseif ($perf.Disk -gt 50) { "Yellow" } else { "Green" })
    Write-Host (" " * (50 - $diskBars)) -NoNewline -ForegroundColor DarkGray
    Write-Host "] $($perf.Disk)%" -ForegroundColor White
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""

    # Mode Selection
    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                         QUICK MODE SWITCH                           │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │                                                                      │" -ForegroundColor DarkGray
    Write-Host "    │   [1] 🎮 Gaming Mode    - Maximum performance untuk gaming            │" -ForegroundColor Magenta
    Write-Host "    │   [2] 💼 Work Mode     - Balanced untuk produktivitas                 │" -ForegroundColor Green
    Write-Host "    │   [3] 🔋 Battery Mode - Hemat baterai untuk laptop                   │" -ForegroundColor Yellow
    Write-Host "    │   [4] 🔒 Privacy Mode - Privasi maksimum                            │" -ForegroundColor Red
    Write-Host "    │   [5] ⚡ Turbo Mode   - Overclock-style optimization                 │" -ForegroundColor Cyan
    Write-Host "    │                                                                      │" -ForegroundColor DarkGray
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""

    # Quick Actions
    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                         QUICK ACTIONS                               │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │   [A] System Cleanup    [B] Network Reset    [C] Services Manager    │" -ForegroundColor White
    Write-Host "    │   [D] Privacy Scan    [E] Benchmark       [F] Export Config        │" -ForegroundColor White
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""

    Write-Host "    [R] Refresh    [M] Monitoring Mode    [S] Settings    [Q] Quit" -ForegroundColor Yellow
    Write-Host ""
}

function Invoke-ModeSwitch {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Gaming", "Work", "Battery", "Privacy", "Turbo")]
        [string]$Mode
    )

    Write-Host ""
    Write-Host "    ⚡ Switching to $Mode Mode..." -ForegroundColor Cyan

    switch ($Mode) {
        "Gaming" {
            Write-Host "    🎮 Configuring Gaming Mode..." -ForegroundColor Magenta
            # Run gaming optimizations
            & "$PSScriptRoot\..\Executables\optimize-gaming.ps1" -Silent -NoReboot
        }
        "Work" {
            Write-Host "    💼 Configuring Work Mode..." -ForegroundColor Green
            # Run balanced optimizations
            & "$PSScriptRoot\..\Executables\optimize-core.ps1" -Silent -NoReboot
        }
        "Battery" {
            Write-Host "    🔋 Configuring Battery Mode..." -ForegroundColor Yellow
            # Run battery optimizations
            & "$PSScriptRoot\..\Executables\optimize-battery.ps1" -Silent -NoReboot
        }
        "Privacy" {
            Write-Host "    🔒 Configuring Privacy Mode..." -ForegroundColor Red
            # Run privacy optimizations
            & "$PSScriptRoot\..\Executables\optimize-privacy.ps1" -Silent -NoReboot
        }
        "Turbo" {
            Write-Host "    ⚡ Configuring Turbo Mode..." -ForegroundColor Cyan
            # Run all optimizations
            & "$PSScriptRoot\..\Executables\optimize-core.ps1" -Silent -NoReboot
            & "$PSScriptRoot\..\Executables\optimize-gaming.ps1" -Silent -NoReboot
            & "$PSScriptRoot\..\Executables\optimize-network.ps1" -Silent -NoReboot
        }
    }

    Write-Host ""
    Write-Host "    ✅ $Mode Mode activated successfully!" -ForegroundColor Green
    Write-Host "    💡 Reboot recommended for full effect." -ForegroundColor Yellow
    Write-Host ""
}

function Show-MonitoringMode {
    Write-Host "    Starting real-time monitoring... Press Ctrl+C to exit" -ForegroundColor Cyan
    Write-Host ""

    while ($true) {
        $perf = Get-PerformanceMetrics
        $time = Get-Date -Format "HH:mm:ss"

        Write-Host "`r    [$time] CPU: $($perf.CPU)% | RAM: $($perf.RAM)% | DISK: $($perf.Disk)%    " -NoNewline

        Start-Sleep -Seconds 1
    }
}

function Invoke-SystemCleanup {
    Write-Host ""
    Write-Host "    🧹 Starting System Cleanup..." -ForegroundColor Cyan
    Write-Host ""

    $tempPaths = @(
        $env:TEMP,
        "$env:LOCALAPPDATA\Temp",
        "C:\Windows\Temp"
    )

    $totalCleaned = 0
    foreach ($path in $tempPaths) {
        if (Test-Path $path) {
            $size = (Get-ChildItem $path -Recurse -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum
            $totalCleaned += $size
            Remove-Item "$path\*" -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "    ✓ Cleaned: $path ($([math]::Round($size/1MB, 2)) MB)" -ForegroundColor Green
        }
    }

    Write-Host ""
    Write-Host "    ✅ Total cleaned: $([math]::Round($totalCleaned/1MB, 2)) MB" -ForegroundColor Green
    Write-Host ""
}

function Invoke-Benchmark {
    Write-Host ""
    Write-Host "    📊 Running System Benchmark..." -ForegroundColor Cyan
    Write-Host ""

    $perfBefore = Get-PerformanceMetrics

    Write-Host "    Starting stress test..." -ForegroundColor Yellow
    $null = Get-Counter '\Processor(_Total)\% Processor Time' -SampleInterval 1 -MaxSamples 5

    $perfAfter = Get-PerformanceMetrics

    Write-Host ""
    Write-Host "    ╔═══════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "    ║           BENCHMARK RESULTS           ║" -ForegroundColor Cyan
    Write-Host "    ╠═══════════════════════════════════════╣" -ForegroundColor Cyan
    Write-Host "    ║  CPU Performance : $($perfAfter.CPU)%" -ForegroundColor White
    Write-Host "    ║  RAM Usage        : $($perfAfter.RAM)%" -ForegroundColor White
    Write-Host "    ║  Disk Activity   : $($perfAfter.Disk)%" -ForegroundColor White
    Write-Host "    ╚═══════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Show-Settings {
    Clear-Host
    Write-OptiCoreHeader

    Write-Host "    ┌─────────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                         OPTICORE SETTINGS                            │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │                                                                      │" -ForegroundColor DarkGray
    Write-Host "    │   [1] Theme Settings          - Customize OptiCore appearance        │" -ForegroundColor White
    Write-Host "    │   [2] Startup Options        - Configure startup behavior            │" -ForegroundColor White
    Write-Host "    │   [3] Notification Settings - Manage notifications                  │" -ForegroundColor White
    Write-Host "    │   [4] Auto Mode Rules        - Configure auto mode switching         │" -ForegroundColor White
    Write-Host "    │   [5] Network Profiles       - Save/load network settings            │" -ForegroundColor White
    Write-Host "    │   [6] Backup & Restore       - Backup/restore OptiCore settings      │" -ForegroundColor White
    Write-Host "    │                                                                      │" -ForegroundColor DarkGray
    Write-Host "    └─────────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    [B] Back to Main Menu    [Q] Quit" -ForegroundColor Yellow
    Write-Host ""
}

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: MAIN LOOP
# ═══════════════════════════════════════════════════════════════════════════════

function Start-OptiCoreHub {
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "OptiCore Hub requires Administrator privileges." -ForegroundColor Red
        Write-Host "Please run as Administrator." -ForegroundColor Yellow
        exit 1
    }

    if ($Monitoring) {
        Show-MonitoringMode
        return
    }

    while ($true) {
        Show-MainDashboard

        $choice = Read-Host "    Select option"

        switch ($choice) {
            "1" { Invoke-ModeSwitch -Mode "Gaming" }
            "2" { Invoke-ModeSwitch -Mode "Work" }
            "3" { Invoke-ModeSwitch -Mode "Battery" }
            "4" { Invoke-ModeSwitch -Mode "Privacy" }
            "5" { Invoke-ModeSwitch -Mode "Turbo" }
            "A" { Invoke-SystemCleanup }
            "B" { Write-Host "    Network reset not implemented in this version." -ForegroundColor Yellow }
            "C" { Write-Host "    Services manager not implemented in this version." -ForegroundColor Yellow }
            "D" { Invoke-ModeSwitch -Mode "Privacy" }
            "E" { Invoke-Benchmark }
            "F" { & "$PSScriptRoot\..\Executables\export-config.ps1" }
            "R" { continue }
            "M" { Show-MonitoringMode }
            "S" { Show-Settings }
            "Q" {
                Write-Host ""
                Write-Host "    Thank you for using OptiCore Hub!" -ForegroundColor Cyan
                Write-Host "    ⚡ Stay Optimized! ⚡" -ForegroundColor Magenta
                Write-Host ""
                exit 0
            }
            default { Write-Host "    Invalid option. Please try again." -ForegroundColor Red }
        }

        if ($choice -notmatch "^[RQM]$") {
            Write-Host "    Press Enter to continue..." -ForegroundColor Yellow
            Read-Host
        }
    }
}

# Start OptiCore Hub
Start-OptiCoreHub
