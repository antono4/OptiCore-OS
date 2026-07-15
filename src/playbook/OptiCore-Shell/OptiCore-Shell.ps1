# ═══════════════════════════════════════════════════════════════════════════════
#  ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗
# ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝
# ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║
# ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║
# ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║
#  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝
#                          SHELL - Desktop Environment
# ═══════════════════════════════════════════════════════════════════════════════
#
#  OptiCore Shell - Custom Desktop Environment untuk Windows
#  Experience futuristik yang berbeda dari Windows standar dan Linux desktop
#
#  Fitur Unik:
#  - Game Console-style App Drawer (bukan Start Menu)
#  - Floating Widget Panel
#  - Quick Action Dock
#  - Performance HUD
#  - Gesture-based Navigation
#
#  Version: 1.0.0
#  Author: OptiCore Team
#
# ═══════════════════════════════════════════════════════════════════════════════

param(
    [switch]$Install,        # Install OptiCore Shell
    [switch]$Uninstall,      # Uninstall OptiCore Shell
    [switch]$EnableWidgets,  # Enable floating widgets
    [switch]$CompactMode     # Compact mode
)

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: CONFIGURATION
# ═══════════════════════════════════════════════════════════════════════════════

$Global:ShellVersion = "1.0.0"
$Global:InstallPath = "$env:APPDATA\OptiCore\Shell"
$Global:SettingsPath = "$env:APPDATA\OptiCore\settings.json"

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: SHELL COMPONENTS
# ═══════════════════════════════════════════════════════════════════════════════

function Write-ShellBanner {
    param([string]$Message, [string]$Color = "Cyan")

    $banner = @"


        ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗
       ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝
       ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║
       ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║
       ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║
        ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝
                    ███████╗███╗   ██╗██████╗ ███████╗██████╗
                    ██╔════╝████╗  ██║██╔══██╗██╔════╝██╔══██╗
                    █████╗  ██╔██╗ ██║██║  ██║█████╗  ██████╔╝
                    ██╔══╝  ██║╚██╗██║██║  ██║██╔══╝  ██╔══██╗
                    ███████╗██║ ╚████║██████╔╝███████╗██║  ██║
                    ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝
                                  ███╗   ███╗ █████╗ ███╗   ██╗
                                  ████╗ ████║██╔══██╗████╗  ██║
                                  ██╔████╔██║███████║██╔██╗ ██║
                                  ██║╚██╔╝██║██╔══██║██║╚██╗██║
                                  ██║ ╚═╝ ██║██║  ██║██║ ╚████║
                                  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝


"@
    Write-Host $banner -ForegroundColor Cyan
    if ($Message) {
        Write-Host "    ⚡ $Message v$Global:ShellVersion" -ForegroundColor White
    }
    Write-Host ""
}

function Install-OptiCoreShell {
    Write-ShellBanner "Installing OptiCore Shell"

    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "    ❌ Administrator privileges required for installation." -ForegroundColor Red
        exit 1
    }

    # Create installation directory
    Write-Host "    📁 Creating OptiCore directories..." -ForegroundColor Yellow
    if (-not (Test-Path $Global:InstallPath)) {
        New-Item -ItemType Directory -Path $Global:InstallPath -Force | Out-Null
    }
    if (-not (Test-Path "$env:APPDATA\OptiCore")) {
        New-Item -ItemType Directory -Path "$env:APPDATA\OptiCore" -Force | Out-Null
    }

    # Copy shell files
    Write-Host "    📦 Copying shell components..." -ForegroundColor Yellow
    Copy-Item -Path $PSCommandPath -Destination "$Global:InstallPath\OptiCore-Shell.exe" -Force

    # Create registry entries for shell replacement
    Write-Host "    🔧 Configuring system shell..." -ForegroundColor Yellow
    $shellPath = "$Global:InstallPath\OptiCore-Shell.exe"

    # Backup current explorer
    $explorerKey = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
    $currentShell = Get-ItemProperty -Path $explorerKey -Name "Shell" -ErrorAction SilentlyContinue

    if ($currentShell) {
        Set-ItemProperty -Path $explorerKey -Name "Shell" -Value "explorer.exe, $shellPath" -Type String
        Write-Host "    ✓ Shell configured successfully" -ForegroundColor Green
    }

    # Create OptiCore Hub shortcut
    Write-Host "    🔗 Creating OptiCore Hub shortcut..." -ForegroundColor Yellow
    $hubSource = "$PSScriptRoot\..\OptiCore-Hub\OptiCore-Hub.ps1"
    $hubDest = "$Global:InstallPath\OptiCore-Hub.lnk"

    $ws = New-Object -ComObject WScript.Shell
    $shortcut = $ws.CreateShortcut($hubDest)
    $shortcut.TargetPath = "powershell.exe"
    $shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$hubSource`""
    $shortcut.Description = "OptiCore Hub - Control Center"
    $shortcut.Save()

    # Create settings file
    $defaultSettings = @{
        version = $Global:ShellVersion
        theme = "nexus-dark"
        accentColor = "#00D4FF"
        widgetPosition = "right"
        autoStart = $true
        compactMode = $false
        showPerformanceHUD = $true
        appDrawerStyle = "console"
    } | ConvertTo-Json

    Set-Content -Path $Global:SettingsPath -Value $defaultSettings -Force

    Write-Host ""
    Write-Host "    ╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "    ║                   INSTALLATION COMPLETE                     ║" -ForegroundColor Cyan
    Write-Host "    ╠════════════════════════════════════════════════════════════╣" -ForegroundColor Cyan
    Write-Host "    ║                                                            ║" -ForegroundColor Cyan
    Write-Host "    ║  ✅ OptiCore Shell installed successfully!                 ║" -ForegroundColor Green
    Write-Host "    ║                                                            ║" -ForegroundColor Cyan
    Write-Host "    ║  📍 Installation Path: $Global:InstallPath              ║" -ForegroundColor White
    Write-Host "    ║                                                            ║" -ForegroundColor Cyan
    Write-Host "    ║  ⚠️  Please restart your computer to apply changes.        ║" -ForegroundColor Yellow
    Write-Host "    ║                                                            ║" -ForegroundColor Cyan
    Write-Host "    ╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Uninstall-OptiCoreShell {
    Write-ShellBanner "Uninstalling OptiCore Shell"

    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "    ❌ Administrator privileges required for uninstallation." -ForegroundColor Red
        exit 1
    }

    # Restore original shell
    Write-Host "    🔧 Restoring original Windows shell..." -ForegroundColor Yellow
    $explorerKey = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
    Set-ItemProperty -Path $explorerKey -Name "Shell" -Value "explorer.exe" -Type String

    # Remove installation directory
    if (Test-Path $Global:InstallPath) {
        Remove-Item -Path $Global:InstallPath -Recurse -Force
        Write-Host "    ✓ Installation directory removed" -ForegroundColor Green
    }

    # Remove settings
    if (Test-Path $Global:SettingsPath) {
        Remove-Item -Path $Global:SettingsPath -Force
    }

    Write-Host ""
    Write-Host "    ✅ OptiCore Shell uninstalled successfully!" -ForegroundColor Green
    Write-Host "    ⚠️  Please restart your computer." -ForegroundColor Yellow
    Write-Host ""
}

function Show-AppDrawer {
    # Game Console-style App Drawer (berbeda dari Start Menu)
    $apps = @(
        @{Name="OptiCore Hub"; Icon="⚡"; Color="Cyan"},
        @{Name="Settings"; Icon="⚙️"; Color="White"},
        @{Name="File Explorer"; Icon="📁"; Color="Yellow"},
        @{Name="Terminal"; Icon="⬛"; Color="Green"},
        @{Name="Browser"; Icon="🌐"; Color="Blue"},
        @{Name="Performance Monitor"; Icon="📊"; Color="Magenta"},
        @{Name="Privacy Scanner"; Icon="🔒"; Color="Red"},
        @{Name="Game Mode"; Icon="🎮"; Color="Magenta"},
        @{Name="Network Tools"; Icon="🌐"; Color="Cyan"},
        @{Name="Cleanup"; Icon="🧹"; Color="Green"},
        @{Name="Registry Editor"; Icon="🔧"; Color="Yellow"},
        @{Name="Task Manager"; Icon="📈"; Color="White"},
        @{Name="Control Panel"; Icon="🎛️"; Color="Blue"},
        @{Name="Calculator"; Icon="🔢"; Color="Cyan"},
        @{Name="Notepad"; Icon="📝"; Color="White"},
        @{Name="Power Options"; Icon="⚡"; Color="Yellow"}
    )

    Clear-Host

    Write-Host @"


        ╔═══════════════════════════════════════════════════════════════════╗
        ║                                                                   ║
        ║     ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗    ║
        ║    ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝    ║
        ║    ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║       ║
        ║    ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║       ║
        ║    ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║       ║
        ║     ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝       ║
        ║                                                                       ║
        ║              ██████╗ ██╗   ██╗██████╗ ███████╗██████╗              ║
        ║              ██╔══██╗██║   ██║██╔══██╗██╔════╝██╔══██╗             ║
        ║              ██████╔╝██║   ██║██████╔╝█████╗  ██████╔╝             ║
        ║              ██╔══██╗██║   ██║██╔══██╗██╔══╝  ██╔══██╗             ║
        ║              ██║  ██║╚██████╔╝██║  ██║███████╗██║  ██║             ║
        ║              ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝             ║
        ║                                                                       ║
        ╚═══════════════════════════════════════════════════════════════════╝


"@ -ForegroundColor Cyan

    Write-Host "    ╔══════════════════════════════════════════════════════════════════╗" -ForegroundColor DarkGray
    Write-Host "    ║                      ALL APPLICATIONS                            ║" -ForegroundColor Cyan
    Write-Host "    ╠══════════════════════════════════════════════════════════════════╣" -ForegroundColor DarkGray

    $col = 0
    foreach ($app in $apps) {
        $padding = " " * (25 - $app.Name.Length)
        $color = switch ($app.Color) {
            "Cyan" { "Cyan" }
            "Magenta" { "Magenta" }
            "Green" { "Green" }
            "Yellow" { "Yellow" }
            "Red" { "Red" }
            "Blue" { "Blue" }
            default { "White" }
        }

        Write-Host -n "    ║  $($app.Icon) $($app.Name)$padding" -ForegroundColor $color

        $col++
        if ($col % 2 -eq 0) {
            Write-Host "  ║" -ForegroundColor DarkGray
        }
    }

    if ($col % 2 -ne 0) {
        Write-Host (" " * 25) "  ║" -ForegroundColor DarkGray
    }

    Write-Host "    ╚══════════════════════════════════════════════════════════════════╝" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    [ESC] Close Drawer    [0-9] Quick Launch    [Type] Search" -ForegroundColor Yellow
    Write-Host ""
}

function Show-PerformanceHUD {
    # Floating Performance HUD
    $perf = @{
        CPU = (Get-Counter '\Processor(_Total)\% Processor Time' -SampleInterval 1 -MaxSamples 1).CounterSamples.CookedValue
        RAM = [math]::Round(((Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize - (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory) / (Get-CimInstance Win32_OperatingSystem).TotalVisibleMemorySize * 100, 1)
        GPU = 0  # Placeholder
        FPS = 0  # Placeholder
    }

    Write-Host @"


        ╔═══════════════════════════════╗
        ║     ⚡ PERFORMANCE HUD        ║
        ╠═══════════════════════════════╣
        ║  CPU  : $([math]::Round($perf.CPU, 1))%              ║
        ║  RAM  : $($perf.RAM)%              ║
        ║  GPU  : N/A                    ║
        ║  FPS  : N/A                    ║
        ╚═══════════════════════════════╝

"@ -ForegroundColor Cyan
}

function Start-OptiCoreShell {
    Write-ShellBanner "OptiCore Shell"

    Write-Host "    ┌─────────────────────────────────────────────────────────────────┐" -ForegroundColor DarkGray
    Write-Host "    │                      SHELL COMPONENTS                            │" -ForegroundColor Cyan
    Write-Host "    ├─────────────────────────────────────────────────────────────────┤" -ForegroundColor DarkGray
    Write-Host "    │                                                                  │" -ForegroundColor DarkGray
    Write-Host "    │   [1] Show App Drawer      - Game console-style app launcher      │" -ForegroundColor White
    Write-Host "    │   [2] Show Performance HUD - Real-time performance overlay       │" -ForegroundColor White
    Write-Host "    │   [3] Quick Actions Menu   - Common tasks and toggles             │" -ForegroundColor White
    Write-Host "    │   [4] Theme Gallery        - Browse OptiCore themes               │" -ForegroundColor White
    Write-Host "    │   [5] Widget Demo          - Demo floating widgets                 │" -ForegroundColor White
    Write-Host "    │                                                                  │" -ForegroundColor DarkGray
    Write-Host "    └─────────────────────────────────────────────────────────────────┘" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    [I] Install Shell    [U] Uninstall Shell    [Q] Quit" -ForegroundColor Yellow
    Write-Host ""

    $choice = Read-Host "    Select option"

    switch ($choice) {
        "1" { Show-AppDrawer }
        "2" { Show-PerformanceHUD }
        "3" { Write-Host "    Quick Actions not implemented in this version." -ForegroundColor Yellow }
        "4" { Write-Host "    Theme Gallery not implemented in this version." -ForegroundColor Yellow }
        "5" { Write-Host "    Widget Demo not implemented in this version." -ForegroundColor Yellow }
        "I" { Install-OptiCoreShell }
        "U" { Uninstall-OptiCoreShell }
        "Q" { exit 0 }
        default { Write-Host "    Invalid option." -ForegroundColor Red }
    }
}

# ═══════════════════════════════════════════════════════════════════════════════
# REGION: MAIN
# ═══════════════════════════════════════════════════════════════════════════════

if ($Install) {
    Install-OptiCoreShell
} elseif ($Uninstall) {
    Uninstall-OptiCoreShell
} else {
    Start-OptiCoreShell
}
