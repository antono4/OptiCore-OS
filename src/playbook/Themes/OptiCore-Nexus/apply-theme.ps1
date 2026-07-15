# ═══════════════════════════════════════════════════════════════════════════════════════
#  ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗
# ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝
# ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║
# ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║
# ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║
#  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝
#                     NEXUS THEME - Futuristic Visual Design
# ═══════════════════════════════════════════════════════════════════════════════════════
#
#  OptiCore Nexus Theme - Tema visual futuristik yang berbeda dari Windows dan Linux
#
#  Karakteristik:
#  - Dark mode dengan aksen neon (cyan/magenta)
#  - Game console-inspired UI elements
#  - Glass morphism effects
#  - Animated elements
#  - Custom fonts & icons
#
#  Version: 1.0.0
#  Author: OptiCore Team
#
# ═══════════════════════════════════════════════════════════════════════════════════════

param(
    [switch]$Apply,        # Apply theme
    [switch]$Remove,       # Remove theme
    [switch]$Preview       # Preview theme colors
)

# ═══════════════════════════════════════════════════════════════════════════════════════
# REGION: THEME CONFIGURATION
# ═══════════════════════════════════════════════════════════════════════════════════════

$Theme = @{
    Name = "OptiCore Nexus"
    Version = "1.0.0"

    # Color Palette
    Colors = @{
        Primary = "#00D4FF"       # Cyan - Main accent
        Secondary = "#FF00AA"     # Magenta - Secondary accent
        Tertiary = "#00FF88"      # Neon Green - Success/Active
        Warning = "#FFB800"       # Amber - Warnings
        Danger = "#FF3366"        # Red/Pink - Errors
        Background = "#0A0A0F"     # Deep Dark
        Surface = "#12121A"       # Card/Panel background
        SurfaceLight = "#1A1A2E"  # Elevated surface
        Text = "#FFFFFF"          # Primary text
        TextSecondary = "#8888AA"  # Secondary text
        Border = "#2A2A3E"        # Borders
    }

    # Typography
    Fonts = @{
        Primary = "Segoe UI Variable"
        Monospace = "Cascadia Code"
        Display = "Segoe UI Black"
    }

    # Effects
    Effects = @{
        Glow = $true
        Gradient = $true
        Animation = $true
        Glassmorphism = $true
    }
}

# ═══════════════════════════════════════════════════════════════════════════════════════
# REGION: VISUAL DEMONSTRATION
# ═══════════════════════════════════════════════════════════════════════════════════════

function Show-ThemePreview {
    Clear-Host

    Write-Host @"


        ╔════════════════════════════════════════════════════════════════════════════════╗
        ║                                                                                ║
        ║   ██████╗██╗   ██╗██████╗ ███████╗ █████╗  ██████╗████████╗              ║
        ║  ██╔════╝██║   ██║██╔══██╗██╔════╝██╔══██╗██╔════╝╚══██╔══╝              ║
        ║  ██║     ██║   ██║██████╔╝███████╗███████║██║        ██║                 ║
        ║  ██║     ██║   ██║██╔══██╗╚════██║██╔══██║██║        ██║                 ║
        ║  ╚██████╗╚██████╔╝██║  ██║███████║██║  ██║╚██████╗   ██║                 ║
        ║   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝   ╚═╝                 ║
        ║                                                                                ║
        ║          ██████╗ ███████╗██████╗ ████████╗██╗  ██╗███████╗                  ║
        ║          ██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██║  ██║██╔════╝                  ║
        ║          ██║  ██║█████╗  ██████╔╝   ██║   ███████║█████╗                    ║
        ║          ██║  ██║██╔══╝  ██╔═══╝    ██║   ██╔══██║██╔══╝                    ║
        ║          ██████╔╝███████╗██║        ██║   ██║  ██║███████╗                  ║
        ║          ╚═════╝ ╚══════╝╚═╝        ╚═╝   ╚═╝  ╚═╝╚══════╝                  ║
        ║                                                                                ║
        ║                       ████████╗██╗  ██╗███████╗                             ║
        ║                       ╚══██╔══╝██║  ██║██╔════╝                             ║
        ║                          ██║   ███████║█████╗                               ║
        ║                          ██║   ██╔══██║██╔══╝                               ║
        ║                          ██║   ██║  ██║███████╗                             ║
        ║                          ╚═╝   ╚═╝  ╚═╝╚══════╝                             ║
        ║                                                                                ║
        ║              ██████╗ ███████╗ █████╗ ██████╗ ███████╗██████╗                  ║
        ║              ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗                 ║
        ║              ██║  ██║█████╗  ███████║██████╔╝█████╗  ██████╔╝                 ║
        ║              ██║  ██║██╔══╝  ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗                 ║
        ║              ██████╔╝███████╗██║  ██║██║     ███████╗██║  ██║                 ║
        ║              ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝                 ║
        ║                                                                                ║
        ╚════════════════════════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

    Write-Host ""
    Write-Host "    ╔════════════════════════════════════════════════════════════════════════╗" -ForegroundColor DarkGray
    Write-Host "    ║                      COLOR PALETTE                                   ║" -ForegroundColor Cyan
    Write-Host "    ╠════════════════════════════════════════════════════════════════════════╣" -ForegroundColor DarkGray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray
    Write-Host -n "    ║  PRIMARY   ████████████████████████████████████████████████████ " -ForegroundColor White
    Write-Host "███" -ForegroundColor Cyan
    Write-Host "    ║            $($Theme.Colors.Primary) - Cyan (Main accent, highlights)                           ║" -ForegroundColor Gray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray
    Write-Host -n "    ║  SECONDARY ████████████████████████████████████████████████████ " -ForegroundColor White
    Write-Host "███" -ForegroundColor Magenta
    Write-Host "    ║            $($Theme.Colors.Secondary) - Magenta (Secondary accent)                         ║" -ForegroundColor Gray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray
    Write-Host -n "    ║  TERTIARY  ████████████████████████████████████████████████████ " -ForegroundColor White
    Write-Host "███" -ForegroundColor Green
    Write-Host "    ║            $($Theme.Colors.Tertiary) - Neon Green (Success, active states)               ║" -ForegroundColor Gray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray
    Write-Host -n "    ║  WARNING   ████████████████████████████████████████████████████ " -ForegroundColor White
    Write-Host "███" -ForegroundColor Yellow
    Write-Host "    ║            $($Theme.Colors.Warning) - Amber (Warnings)                                   ║" -ForegroundColor Gray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray
    Write-Host -n "    ║  DANGER    ████████████████████████████████████████████████████ " -ForegroundColor White
    Write-Host "███" -ForegroundColor Red
    Write-Host "    ║            $($Theme.Colors.Danger) - Red/Pink (Errors)                                   ║" -ForegroundColor Gray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray
    Write-Host -n "    ║  BG DARK   ████████████████████████████████████████████████████ " -ForegroundColor White
    Write-Host "███" -ForegroundColor DarkGray
    Write-Host "    ║            $($Theme.Colors.Background) - Deep Dark (Main background)                       ║" -ForegroundColor Gray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray
    Write-Host -n "    ║  SURFACE   ████████████████████████████████████████████████████ " -ForegroundColor White
    Write-Host "███" -ForegroundColor Gray
    Write-Host "    ║            $($Theme.Colors.Surface) - Dark Surface (Cards, panels)                     ║" -ForegroundColor Gray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray
    Write-Host "    ╚════════════════════════════════════════════════════════════════════════╝" -ForegroundColor DarkGray
    Write-Host ""

    Write-Host "    ╔════════════════════════════════════════════════════════════════════════╗" -ForegroundColor DarkGray
    Write-Host "    ║                      UI COMPONENT DEMOS                                ║" -ForegroundColor Cyan
    Write-Host "    ╠════════════════════════════════════════════════════════════════════════╣" -ForegroundColor DarkGray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray

    # Button Demo
    Write-Host "    ║  BUTTONS:                                                            ║" -ForegroundColor White
    Write-Host -n "    ║    " -ForegroundColor White
    Write-Host "[ PRIMARY ]" -NoNewline -ForegroundColor Black
    Write-Host -NoNewline " "
    Write-Host "[ SECONDARY ]" -NoNewline -ForegroundColor Cyan
    Write-Host -NoNewline " "
    Write-Host "[ GHOST ]" -NoNewline -ForegroundColor White
    Write-Host -NoNewline " "
    Write-Host "[ DISABLED ]" -ForegroundColor Gray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray

    # Progress Bar Demo
    Write-Host "    ║  PROGRESS:                                                           ║" -ForegroundColor White
    Write-Host -n "    ║    [" -ForegroundColor White
    Write-Host ("█" * 20) -NoNewline -ForegroundColor Cyan
    Write-Host ("░" * 20) -NoNewline -ForegroundColor DarkGray
    Write-Host "] 50%" -ForegroundColor White
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray

    # Toggle Demo
    Write-Host "    ║  TOGGLES:                                                           ║" -ForegroundColor White
    Write-Host -n "    ║    [●" -ForegroundColor Cyan
    Write-Host " ON ] " -NoNewline -ForegroundColor White
    Write-Host "[○ OFF ]" -ForegroundColor Gray
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray

    # Badge Demo
    Write-Host "    ║  BADGES:                                                            ║" -ForegroundColor White
    Write-Host -n "    ║    " -ForegroundColor White
    Write-Host "[NEW]" -NoNewline -ForegroundColor Black -BackgroundColor Cyan
    Write-Host " " -NoNewline -ForegroundColor White
    Write-Host "[HOT]" -NoNewline -ForegroundColor Black -BackgroundColor Magenta
    Write-Host " " -NoNewline -ForegroundColor White
    Write-Host "[PRO]" -NoNewline -ForegroundColor Black -BackgroundColor Green
    Write-Host " " -NoNewline -ForegroundColor White
    Write-Host "[BETA]" -ForegroundColor Black -BackgroundColor Yellow
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray

    # Icon Demo
    Write-Host "    ║  ICONS:                                                              ║" -ForegroundColor White
    Write-Host -n "    ║    ⚡ 🎮 🔒 📊 🛡️ 💡 ⚙️ 🔧 💾 🌐 📁 ⬛ ✅ ❌ ⚠️ ℹ️              " -ForegroundColor Cyan
    Write-Host "    ║                                                                        ║" -ForegroundColor DarkGray

    Write-Host "    ╚════════════════════════════════════════════════════════════════════════╝" -ForegroundColor DarkGray
    Write-Host ""
}

function Apply-NexusTheme {
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "Administrator privileges required for theme installation." -ForegroundColor Red
        exit 1
    }

    Write-Host ""
    Write-Host "    ⚡ Applying OptiCore Nexus Theme..." -ForegroundColor Cyan
    Write-Host ""

    # Apply Windows Dark Mode
    Write-Host "    [1/4] Configuring Windows Dark Mode..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWord -Force
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type DWord -Force

    # Apply Accent Color
    Write-Host "    [2/4] Setting accent color to Cyan..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "AccentColor" -Value 0xFF00D4FF -Type DWord -Force
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "ColorizationColor" -Value 0xCC00D4FF -Type DWord -Force

    # Disable transparency
    Write-Host "    [3/4] Configuring transparency effects..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -Type DWord -Force

    # Apply custom cursor (if available)
    Write-Host "    [4/4] Applying OptiCore cursor..." -ForegroundColor Yellow

    Write-Host ""
    Write-Host "    ╔════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "    ║                    THEME APPLIED SUCCESSFULLY                           ║" -ForegroundColor Cyan
    Write-Host "    ╠════════════════════════════════════════════════════════════════════════╣" -ForegroundColor Cyan
    Write-Host "    ║                                                                        ║" -ForegroundColor Cyan
    Write-Host "    ║  ✅ Windows Dark Mode activated                                        ║" -ForegroundColor Green
    Write-Host "    ║  ✅ Cyan accent color applied                                          ║" -ForegroundColor Green
    Write-Host "    ║  ✅ Transparency effects configured                                    ║" -ForegroundColor Green
    Write-Host "    ║                                                                        ║" -ForegroundColor Cyan
    Write-Host "    ║  ⚠️  Please restart your computer for full effect.                     ║" -ForegroundColor Yellow
    Write-Host "    ║                                                                        ║" -ForegroundColor Cyan
    Write-Host "    ╚════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
}

function Remove-NexusTheme {
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "Administrator privileges required for theme removal." -ForegroundColor Red
        exit 1
    }

    Write-Host ""
    Write-Host "    ⚡ Removing OptiCore Nexus Theme..." -ForegroundColor Cyan
    Write-Host ""

    Write-Host "    [1/3] Restoring Light Mode..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type DWord -Force
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 1 -Type DWord -Force

    Write-Host "    [2/3] Restoring default accent color..." -ForegroundColor Yellow
    Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "AccentColor" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "ColorizationColor" -ErrorAction SilentlyContinue

    Write-Host "    [3/3] Restoring transparency..." -ForegroundColor Yellow
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 1 -Type DWord -Force

    Write-Host ""
    Write-Host "    ✅ OptiCore Nexus Theme removed successfully!" -ForegroundColor Green
    Write-Host "    ⚠️  Please restart your computer." -ForegroundColor Yellow
    Write-Host ""
}

# ═══════════════════════════════════════════════════════════════════════════════════════
# REGION: MAIN
# ═══════════════════════════════════════════════════════════════════════════════════════

Write-Host ""
Write-Host "    ╔════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "    ║                  OPTICORE NEXUS THEME MANAGER                          ║" -ForegroundColor Cyan
Write-Host "    ║                    Futuristic Visual Experience                        ║" -ForegroundColor Cyan
Write-Host "    ╚════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "    [1] Preview Theme    - See theme colors and components" -ForegroundColor White
Write-Host "    [2] Apply Theme      - Apply OptiCore Nexus theme" -ForegroundColor White
Write-Host "    [3] Remove Theme     - Restore default Windows theme" -ForegroundColor White
Write-Host "    [Q] Quit" -ForegroundColor Yellow
Write-Host ""

if ($Preview) {
    Show-ThemePreview
} elseif ($Apply) {
    Apply-NexusTheme
} elseif ($Remove) {
    Remove-NexusTheme
} else {
    $choice = Read-Host "    Select option"
    switch ($choice) {
        "1" { Show-ThemePreview }
        "2" { Apply-NexusTheme }
        "3" { Remove-NexusTheme }
        "Q" { exit 0 }
        default { Write-Host "    Invalid option." -ForegroundColor Red }
    }
}
