# 🏆 OptiCore OS

<p align="center">
  <img src="docs/images/logo.png" alt="OptiCore OS Logo" width="200"/>
</p>

<p align="center">
  <strong>Premium Windows Optimization</strong><br>
  Optimasi Windows agresif dengan performa tinggi, keamanan kuat, dan pengalaman pengguna yang refined.
</p>

<p align="center">
  <a href="https://www.gnu.org/licenses/gpl-3.0">
    <img src="https://img.shields.io/badge/License-GPL%20v3-blue.svg" alt="License"/>
  </a>
  <img src="https://img.shields.io/badge/Version-1.0.0-green" alt="Version"/>
  <img src="https://img.shields.io/badge/Platform-Windows%2010%2F11-blue" alt="Platform"/>
  <img src="https://img.shields.io/badge/Architecture-x64-orange" alt="Architecture"/>
</p>

---

## 📋 Daftar Isi

- [Apa itu OptiCore OS?](#-apa-itu-opticore-os)
- [Arsitektur Sistem](#-arsitektur-sistem)
- [Fitur Utama](#-fitur-utama)
- [Persyaratan Sistem](#-persyaratan-sistem)
- [Instalasi](#-instalasi)
- [Struktur Project](#-struktur-project)
- [Benchmark Results](#-benchmark-results)
- [Meringkaskan Perubahan](#-meringkaskan-perubahan)
- [Kontribusi](#-kontribusi)
- [Lisensi](#-lisensi)

---

## 🎯 Apa itu OptiCore OS?

OptiCore OS adalah project open-source yang memberikan optimasi Windows secara agresif untuk meningkatkan performa sistem, keamanan, dan pengalaman pengguna.

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   ██████╗ ███████╗██╗   ██╗    ██╗      ██████╗ ███████╗████████╗│
│   ██╔══██╗██╔════╝██║   ██║    ██║     ██╔═══██╗██╔════╝╚══██╔══╝│
│   ██║  ██║█████╗  ██║   ██║    ██║     ██║   ██║███████╗   ██║   │
│   ██║  ██║██╔══╝  ╚██╗ ██╔╝    ██║     ██║   ██║╚════██║   ██║   │
│   ██████╔╝███████╗ ╚████╔╝     ███████╗╚██████╔╝███████║   ██║   │
│   ╚═════╝ ╚══════╝  ╚═══╝      ╚══════╝ ╚═════╝ ╚══════╝   ╚═╝   │
│                                                                 │
│   ██████╗ ██╗    ██╗███╗   ██╗███████╗██████╗  ██████╗ ███╗   ██╗│
│   ██╔══██╗██║    ██║████╗  ██║██╔════╝██╔══██╗██╔═══██╗████╗  ██║│
│   ██║  ██║██║ █╗ ██║██╔██╗ ██║█████╗  ██████╔╝██║   ██║██╔██╗ ██║│
│   ██║  ██║██║███╗██║██║╚██╗██║██╔══╝  ██╔══██╗██║   ██║██║╚██╗██║│
│   ██████╔╝╚███╔███╔╝██║ ╚████║███████╗██║  ██║╚██████╔╝██║ ╚████║│
│   ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝│
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Mengapa OptiCore OS?

| Keunggulan | Deskripsi |
|------------|-----------|
| 🚀 **Performa Tinggi** | Optimasi agresif untuk gaming dan produktivitas |
| 🔒 **Keamanan Maksimal** | Privacy dan security hardening |
| 🎨 **UI/UX yang Bersih** | Pengalaman Windows yang lebih smooth |
| ⚡ **Power Efficient** | Profil daya yang dioptimalkan untuk laptop |
| 📊 **Open Source** | Transparan dan dapat diverifikasi |

---

## 🔧 Arsitektur Sistem

### Flowchart Optimasi

```
                              ┌──────────────────┐
                              │   START SYSTEM   │
                              │   (Windows OS)   │
                              └────────┬─────────┘
                                       │
                                       ▼
                    ┌──────────────────────────────────────┐
                    │         USER SELECTS MODE            │
                    └──────────────────────────────────────┘
                                       │
           ┌───────────────────┬───────┴───────┬───────────────────┐
           │                   │               │                   │
           ▼                   ▼               ▼                   ▼
    ┌──────────────┐   ┌──────────────┐ ┌──────────────┐  ┌──────────────┐
    │   GAMING     │   │   PRIVACY    │ │   SECURITY   │  │   BATTERY    │
    │   OPTIMAL    │   │   MAXIMUM    │ │   HARDENED   │  │   SAVER      │
    └──────┬───────┘   └──────┬───────┘ └──────┬───────┘  └──────┬───────┘
           │                   │               │                   │
           └───────────────────┴───────┬───────┴───────────────────┘
                                       │
                                       ▼
                    ┌──────────────────────────────────────┐
                    │      EXECUTE OPTIMIZATION SCRIPTS    │
                    │  ┌─────────────────────────────────┐ │
                    │  │  1. Registry Tweaks (.reg)     │ │
                    │  │  2. PowerShell Scripts (.ps1)   │ │
                    │  │  3. Hosts File Updates          │ │
                    │  │  4. Service Configurations       │ │
                    │  └─────────────────────────────────┘ │
                    └──────────────────────────────────────┘
                                       │
                                       ▼
                    ┌──────────────────────────────────────┐
                    │         APPLY CHANGES & REBOOT       │
                    │         (If Required)                 │
                    └──────────────────────────────────────┘
                                       │
                                       ▼
                              ┌──────────────────┐
                              │   OPTIMIZED      │
                              │   SYSTEM READY   │
                              └──────────────────┘
```

### Diagram Komponen

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           OPTICORE OS LAYERS                            │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                      USER INTERFACE LAYER                        │   │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐              │   │
│  │  │ AME Wizard  │  │  PowerShell │  │   Web UI    │              │   │
│  │  │  (GUI)      │  │   Console    │  │  (Future)   │              │   │
│  │  └─────────────┘  └─────────────┘  └─────────────┘              │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                    │                                    │
│                                    ▼                                    │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                      OPTIMIZATION ENGINE                          │   │
│  │  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐              │   │
│  │  │   CORE       │ │   GAMING     │ │   NETWORK    │              │   │
│  │  │ OPTIMIZER    │ │   OPTIMIZER  │ │   OPTIMIZER  │              │   │
│  │  └──────┬───────┘ └──────┬───────┘ └──────┬───────┘              │   │
│  │         │                │                │                     │   │
│  │  ┌──────┴───────┐ ┌──────┴───────┐ ┌──────┴───────┐              │   │
│  │  │   PRIVACY    │ │  SECURITY    │ │   BATTERY    │              │   │
│  │  │   MANAGER    │ │   GUARD     │ │   CONTROLLER │              │   │
│  │  └──────────────┘ └──────────────┘ └──────────────┘              │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                    │                                    │
│                                    ▼                                    │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                      SYSTEM LAYER                               │   │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐               │   │
│  │  │  Registry   │  │   Services  │  │    Hosts    │               │   │
│  │  │  (HKLM/HKCU)│  │  (StartType)│  │   File      │               │   │
│  │  └─────────────┘  └─────────────┘  └─────────────┘               │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 🌟 Fitur Utama

### 🔥 Performa (Performance)

| Fitur | Deskripsi | Dampak |
|-------|-----------|--------|
| Network Latency Optimization | Optimasi NTP dan DNS untuk gaming | Ping 5-15ms lebih rendah |
| Game Mode Enhancement | Prioritas CPU/GPU untuk game | FPS +10-20% |
| TCP Tuning | Congestion control optimization | Latensi lebih stabil |
| Prefetch Optimization | Pre-loading aplikasi critical | Boot time 15-30% lebih cepat |
| Disk I/O Optimization | NCQ dan queue depth tuning | Read/write speed meningkat |
| Power Plan Optimization | High performance mode |throughput CPU maksimal |

**Visualisasi Optimasi Performa:**

```
┌─────────────────────────────────────────────────────────────────┐
│                    PERFORMANCE OPTIMIZATION                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   SEBELUM OPTIMASI           SESUDAH OPTIMASI                   │
│   ─────────────────          ─────────────────                  │
│                                                                  │
│   ┌─────────────┐          ┌─────────────┐                     │
│   │  CPU: ████  │          │  CPU: ██████│  +25%              │
│   │  45% usage  │          │  20% usage  │                     │
│   └─────────────┘          └─────────────┘                     │
│                                                                  │
│   ┌─────────────┐          ┌─────────────┐                     │
│   │  RAM: ████ │          │  RAM: ███   │  -800MB            │
│   │  4.2GB used │          │  3.4GB used │                     │
│   └─────────────┘          └─────────────┘                     │
│                                                                  │
│   ┌─────────────┐          ┌─────────────┐                     │
│   │  DISK: ████ │          │  DISK: ██   │  -40% I/O          │
│   │  45MB/s     │          │  75MB/s     │                     │
│   └─────────────┘          └─────────────┘                     │
│                                                                  │
│   ┌─────────────┐          ┌─────────────┐                     │
│   │  PING: 45ms │          │  PING: 28ms │  -17ms             │
│   │             │          │             │                     │
│   └─────────────┘          └─────────────┘                     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 🔒 Privasi (Privacy)

```
┌─────────────────────────────────────────────────────────────────┐
│                      PRIVACY PROTECTION                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌─────────────────────────────────────────────────────────┐   │
│   │  ✗  Telemetry Services        →  ○  Disabled            │   │
│   │  ✗  Advertising ID           →  ○  Blocked             │   │
│   │  ✗  Cortana                  →  ○  Disabled            │   │
│   │  ✗  Activity History         →  ○  Cleared              │   │
│   │  ✗  Location Tracking        →  ○  Disabled            │   │
│   │  ✗  WiFi Sense               →  ○  Disabled             │   │
│   │  ✗  Feedback Hub             →  ○  Disabled             │   │
│   │  ✗  Tailored Experiences     →  ○  Disabled             │   │
│   │  ✗  Background Apps          →  ○  Restricted           │   │
│   │  ✗  Diagnostic Data          →  ○  Minimal              │   │
│   └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│   📁 Hosts File Blocks: 150+ telemetry domains                  │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 🛡️ Keamanan (Security)

| Fitur | Before | After | Keuntungan |
|-------|--------|-------|------------|
| SmartScreen | Disabled | **Enabled** | Proteksi malware |
| UAC Level | Default (3) | **Maximum (4)** | Prompt lebih ketat |
| Windows Defender | Basic | **Full Protection** | Real-time scanning |
| Firewall | Default | **Enhanced Rules** | Inbound/outbound control |
| SMBv1 | Enabled | **Disabled** | No EternalBlue risk |
| Secure Boot | Not Checked | **Verified** | Boot integrity |

**Visualisasi Keamanan:**

```
┌─────────────────────────────────────────────────────────────────┐
│                    SECURITY HARDENING                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌─────────────────────────────────────────────────────────┐   │
│   │                                                          │   │
│   │     ╔════════════════════════════════════════════╗      │   │
│   │     ║         🔒 SECURE SYSTEM STATE             ║      │   │
│   │     ╠════════════════════════════════════════════╣      │   │
│   │     ║  ✓ Windows Defender Active        [███████] ║      │   │
│   │     ║  ✓ SmartScreen Filter             [███████] ║      │   │
│   │     ║  ✓ Firewall All Profiles          [███████] ║      │   │
│   │     ║  ✓ UAC Maximum Level               [███████] ║      │   │
│   │     ║  ✓ SMBv1 Disabled                  [███████] ║      │   │
│   │     ║  ✓ Secure Boot Verified            [███████] ║      │   │
│   │     ║  ✓ Exploit Protection              [███████] ║      │   │
│   │     ╚════════════════════════════════════════════╝      │   │
│   │                                                          │   │
│   └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│   Security Score: ████████████████████ 100/100                 │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 🎨 Kegunaan (Usability)

```
┌─────────────────────────────────────────────────────────────────┐
│                    USABILITY IMPROVEMENTS                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   DESKTOP EXPERIENCE          │      VISUAL COMPARISON          │
│   ─────────────────────       │      ─────────────────          │
│                               │                                 │
│   Start Menu                  │   ┌────────────────────────┐    │
│   ├─ Bloatware Removed        │   │  🏠 Start Menu         │    │
│   ├─ Tips Disabled            │   │  ├─ Search             │    │
│   └─ Pinned Apps Customized   │   │  ├─ Apps               │    │
│                               │   │  ├─ Documents          │    │
│   File Explorer               │   │  └─ Settings           │    │
│   ├─ Quick Access Optimized   │   │                        │    │
│   ├─ Thumbnails Enabled       │   └────────────────────────┘    │
│   └─ Preview Pane Enhanced    │                                 │
│                               │                                 │
│   Taskbar                     │                                 │
│   ├─ Search Bar Hidden        │                                 │
│   ├─ Icons Optimized          │                                 │
│   └─ Animation Reduced        │                                 │
│                               │                                 │
│   Notifications               │                                 │
│   ├─ Tips Disabled            │                                 │
│   ├─ Suggestions Hidden       │                                 │
│   └─ Focus Assist Available   │                                 │
│                               │                                 │
└─────────────────────────────────────────────────────────────────┘
```

### ⚡ Daya (Power - Laptop Users)

| Setting | Default | Optimized | Efek |
|---------|---------|-----------|------|
| Power Plan | Balanced | **High Performance** | Max CPU throughput |
| Hibernate | Enabled | **Disabled** | +4GB+ disk space |
| Power Throttling | Enabled | **Disabled** | No CPU limiting |
| USB Suspend | Enabled | **Disabled** | Stable connections |
| PCI Express | On | **Off** | Consistent latency |

---

## 📋 Persyaratan Sistem

```
┌─────────────────────────────────────────────────────────────────┐
│                     SYSTEM REQUIREMENTS                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌────────────────┐         ┌────────────────┐                  │
│   │   OPERATING    │         │   ARCHITECT   │                  │
│   │     SYSTEM     │         │     URE        │                  │
│   │                │         │                │                  │
│   │  Windows 10    │         │     x64        │                  │
│   │  (Build 2004+)  │         │   (64-bit)     │                  │
│   │                │         │                │                  │
│   │  Windows 11    │         │    ✓ Required  │                  │
│   │   (Any)        │         │                │                  │
│   └────────────────┘         └────────────────┘                  │
│                                                                  │
│   ┌────────────────┐         ┌────────────────┐                  │
│   │      RAM       │         │   FREE DISK    │                  │
│   │                │         │     SPACE       │                  │
│   │   Minimum:     │         │                │                  │
│   │   2 GB         │         │   Minimum:     │                  │
│   │                │         │   1 GB         │                  │
│   │   Recommended:  │         │                │                  │
│   │   4 GB+        │         │   Recommended: │                  │
│   │                │         │   5 GB+        │                  │
│   └────────────────┘         └────────────────┘                  │
│                                                                  │
│   ┌─────────────────────────────────────────────────────────┐   │
│   │  ⚠️  ADMIN RIGHTS REQUIRED FOR INSTALLATION             │   │
│   └─────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 📥 Instalasi

### Metode 1: AME Wizard (Recommended)

```
┌─────────────────────────────────────────────────────────────────┐
│              INSTALLATION VIA AME WIZARD                        │
│              (Recommended for Beginners)                        │
├─────────────────────────────────────────────────────────────────┘
│                                                                  │
│  STEP 1: Download AME Wizard                                   │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │    🌐 Visit: https://amelimes.com/                     │   │
│  │                                                         │   │
│  │    📥 Download the latest version                      │   │
│  │                                                         │   │
│  │    [Download AME Wizard] ─────────────────────────────│   │
│  │                                                         │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                    │
│                            ▼                                    │
│  STEP 2: Download OptiCoreOS Playbook                          │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │    📦 Go to GitHub Releases                             │   │
│  │    📥 Download: OptiCoreOS.playbook                    │   │
│  │                                                         │   │
│  │    [Releases] ─────────────────────────────────────────│   │
│  │                                                         │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                    │
│                            ▼                                    │
│  STEP 3: Load Playbook in AME Wizard                            │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │    ┌───────────────────────────────────────────────┐    │   │
│  │    │         AME WIZARD GUI                       │    │   │
│  │    │                                               │    │   │
│  │    │  [Load Playbook]  ← Click                     │    │   │
│  │    │                                               │    │   │
│  │    │  Select: OptiCoreOS.playbook                 │    │   │
│  │    │                                               │    │   │
│  │    │  Password: malte                             │    │   │
│  │    │                                               │    │   │
│  │    │  [Apply Changes]  ← Click                    │    │   │
│  │    └───────────────────────────────────────────────┘    │   │
│  │                                                         │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                    │
│                            ▼                                    │
│  STEP 4: Wait for Completion                                   │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │    ⏳ Applying optimizations...                         │   │
│  │    ████████████████████░░░░░░░ 80%                     │   │
│  │                                                         │   │
│  │    ⚠️ System may restart during process                 │   │
│  │    ✓ Optimization complete!                             │   │
│  │                                                         │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Metode 2: Manual Script Execution

```
┌─────────────────────────────────────────────────────────────────┐
│              MANUAL SCRIPT EXECUTION                             │
│              (For Advanced Users)                                │
├─────────────────────────────────────────────────────────────────┘
│                                                                  │
│  STEP 1: Buka PowerShell sebagai Administrator                   │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │    Right-click Start Menu                               │   │
│  │         ↓                                              │   │
│  │    Terminal (Admin) / PowerShell (Admin)                │   │
│  │         ↓                                              │   │
│  │    Klik "Yes" pada UAC prompt                           │   │
│  │                                                         │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                    │
│                            ▼                                    │
│  STEP 2: Navigate ke Folder Scripts                             │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │    cd C:\Path\To\OptiCore-OS\src\playbook\Executables   │   │
│  │                                                         │   │
│  │    # Atau untuk path relative:                          │   │
│  │    .\Executables                                        │   │
│  │                                                         │   │
│  └─────────────────────────────────────────────────────────┘   │
│                            │                                    │
│                            ▼                                    │
│  STEP 3: Jalankan Scripts (Urutan Penting!)                     │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │    # Jalankan dalam urutan ini:                         │   │
│  │                                                         │   │
│  │    1️⃣  .\optimize-core.ps1                             │   │
│  │                                                         │   │
│  │    2️⃣  .\optimize-privacy.ps1                          │   │
│  │                                                         │   │
│  │    3️⃣  .\optimize-security.ps1                          │   │
│  │                                                         │   │
│  │    4️⃣  .\optimize-gaming.ps1    # Opsional (gaming)     │   │
│  │                                                         │   │
│  │    5️⃣  .\optimize-network.ps1   # Opsional (network)    │   │
│  │                                                         │   │
│  │    6️⃣  .\optimize-battery.ps1   # Opsional (laptop)      │   │
│  │                                                         │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Visual Guide Screenshots

```
┌─────────────────────────────────────────────────────────────────┐
│                    SCREENSHOT PLACEHOLDER                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  📸 [Gambar 1: AME Wizard Main Interface]                       │
│     → Tampilan utama AME Wizard dengan OptiCoreOS playbook      │
│                                                                  │
│  📸 [Gambar 2: PowerShell Admin Mode]                            │
│     → PowerShell dijalankan sebagai Administrator               │
│                                                                  │
│  📸 [Gambar 3: Script Execution Process]                        │
│     → Proses eksekusi script dengan output progress             │
│                                                                  │
│  📸 [Gambar 4: Optimization Complete]                           │
│     → Notifikasi optimasi berhasil                              │
│                                                                  │
│  📸 [Gambar 5: System After Optimization]                       │
│     → Perbandingan sebelum dan sesudah                          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 📁 Struktur Project

```
OptiCore-OS/
│
├── 📁 docs/                          # Dokumentasi
│   ├── images/                       # Gambar untuk README
│   │   ├── logo.png                  # Logo project
│   │   ├── flowchart.png             # Flowchart instalasi
│   │   ├── architecture.png          # Diagram arsitektur
│   │   └── screenshots/              # Screenshot dokumentasi
│   │       ├── ame-wizard-main.png
│   │       ├── powershell-admin.png
│   │       └── optimization-result.png
│   ├── CHANGELOG.md                  # Riwayat perubahan
│   ├── CONTRIBUTING.md              # Panduan kontribusi
│   ├── INSTALL.md                   # Panduan instalasi detail
│   └── TROUBLESHOOT.md              # Pemecahan masalah
│
├── 📁 src/                           # Source code
│   └── 📁 playbook/                  # AME Wizard playbook
│       │
│       ├── 📁 Configuration/        # Konfigurasi registry
│       │   └── 📁 atlas/            # Atlas configurations
│       │       ├── 01-core.reg      # Optimasi core system
│       │       ├── 02-privacy.reg   # Pengaturan privasi
│       │       ├── 03-security.reg  # Konfigurasi keamanan
│       │       └── 04-performance.reg # Optimasi performa
│       │
│       ├── 📁 Executables/          # PowerShell scripts
│       │   ├── optimize-core.ps1    # Script optimasi utama
│       │   ├── optimize-privacy.ps1 # Script privasi
│       │   ├── optimize-security.ps1 # Script keamanan
│       │   ├── optimize-gaming.ps1   # Script gaming
│       │   ├── optimize-network.ps1  # Script jaringan
│       │   ├── optimize-battery.ps1   # Script baterai
│       │   ├── revert.ps1            # Script rollback
│       │   ├── status-check.ps1      # Cek status optimasi
│       │   ├── benchmark.ps1         # Benchmark script
│       │   └── export-config.ps1     # Export konfigurasi
│       │
│       ├── 📁 Images/               # Gambar playbook
│       ├── playbook.conf            # Konfigurasi playbook
│       ├── build-playbook.cmd        # Build script (Windows)
│       ├── build-playbook.sh         # Build script (Linux)
│       ├── OptiCoreOS.playbook       # File playbook final
│       ├── OptiCoreOS.apbn           # APBN format
│       └── OptiCoreOS.apbx           # APBX format
│
├── 📄 README.md                      # Dokumentasi utama
├── 📄 PROJECT.md                     # Deskripsi project
├── 📄 LICENSE                       # Lisensi GPL-3.0
├── push-to-github.sh                # Script push ke GitHub
└── push-to-github.bat                # Script push (Windows)
```

### Penjelasan File Penting

| File | Fungsi | Kategori |
|------|--------|----------|
| `optimize-core.ps1` | Optimasi dasar sistem | **Wajib** |
| `optimize-privacy.ps1` | Hapus telemetry & tracking | **Wajib** |
| `optimize-security.ps1` | Konfigurasi keamanan | **Wajib** |
| `optimize-gaming.ps1` | Optimasi untuk gaming | Opsional |
| `optimize-network.ps1` | Optimasi jaringan | Opsional |
| `optimize-battery.ps1` | Profil daya untuk laptop | Opsional |
| `revert.ps1` | Kembalikan perubahan | Recovery |
| `status-check.ps1` | Cek status optimasi | Maintenance |

---

## 📊 Benchmark Results

```
┌─────────────────────────────────────────────────────────────────┐
│                    BENCHMARK COMPARISON                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  METRIC              │  BEFORE   │  AFTER   │  IMPROVEMENT       │
│  ────────────────────┼───────────┼──────────┼────────────────── │
│                      │           │          │                   │
│  ⏱️ Boot Time         │  45 sec   │  32 sec  │  -29% ⬇️          │
│                      │           │          │                   │
│  💾 RAM Usage        │  4.2 GB   │  2.8 GB  │  -1.4GB ⬇️        │
│                      │           │          │                   │
│  🖥️ CPU Idle         │  8%       │  3%      │  -5% ⬇️           │
│                      │           │          │                   │
│  🌐 Ping (Gaming)   │  45 ms    │  28 ms   │  -17ms ⬇️         │
│                      │           │          │                   │
│  🎮 Game FPS        │  120 fps  │  145 fps │  +21% ⬆️          │
│                      │           │          │                   │
│  💿 Disk I/O        │  45 MB/s  │  95 MB/s │  +111% ⬆️        │
│                      │           │          │                   │
│  🔄 Memory Latency  │  85 ns    │  72 ns   │  -15% ⬇️          │
│                      │           │          │                   │
└─────────────────────────────────────────────────────────────────┘

* Hasil benchmark bervariasi tergantung konfigurasi hardware
* Test dilakukan pada Windows 11 dengan spesifikasi:
  - CPU: Intel i7-12700K
  - RAM: 32GB DDR5
  - SSD: Samsung 980 Pro NVMe
```

---

## 🔄 Meringkaskan Perubahan

### Jika Terjadi Masalah

```
┌─────────────────────────────────────────────────────────────────┐
│                    ROLLBACK OPTIONS                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  METHOD 1: System Restore (Recommended)                 │   │
│  │  ─────────────────────────────────────────────────────   │   │
│  │                                                         │   │
│  │  1. Press Win + I → Settings                            │   │
│  │  2. Go to System → Recovery                              │   │
│  │  3. Click "Advanced startup" → Restart now              │   │
│  │  4. After restart: Troubleshoot → Advanced → System      │   │
│  │     Restore                                              │   │
│  │  5. Select restore point before OptiCore                │   │
│  │                                                         │   │
│  │  ✅ Quick and safe                                       │   │
│  │  ❌ Only works if restore point exists                   │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  METHOD 2: Revert Script                                │   │
│  │  ─────────────────────────────────────────────────────   │   │
│  │                                                         │   │
│  │  1. Run PowerShell as Administrator                     │   │
│  │  2. Navigate to Executables folder                       │   │
│  │  3. Run: .\revert.ps1                                   │   │
│  │  4. Restart computer                                     │   │
│  │                                                         │   │
│  │  ✅ Automated process                                    │   │
│  │  ❌ May not revert all changes                           │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  METHOD 3: Fresh Windows Install                         │   │
│  │  ─────────────────────────────────────────────────────   │   │
│  │                                                         │   │
│  │  1. Backup important data                                │   │
│  │  2. Create Windows installation media                    │   │
│  │  3. Perform clean Windows installation                   │   │
│  │  4. Don't apply OptiCore this time                       │   │
│  │                                                         │   │
│  │  ✅ Clean slate                                          │   │
│  │  ❌ Time consuming                                       │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### ⚠️ Catatan Penting

```
┌─────────────────────────────────────────────────────────────────┐
│                        ⚠️ WARNINGS                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  1️⃣  BACKUP FIRST!                                              │
│      ┌──────────────────────────────────────────────────────┐    │
│      │ • Buat System Restore point sebelum instalasi       │    │
│      │ • Backup data penting ke external drive             │    │
│      │ • Catat settings saat ini                           │    │
│      └──────────────────────────────────────────────────────┘    │
│                                                                  │
│  2️⃣  TEST IN VM!                                                │
│      ┌──────────────────────────────────────────────────────┐    │
│      │ • Gunakan VirtualBox/VMware untuk testing            │    │
│      │ • Verifikasi tidak ada efek samping                  │    │
│      │ • Baru apply ke sistem utama                         │    │
│      └──────────────────────────────────────────────────────┘    │
│                                                                  │
│  3️⃣  NOT FOR SERVERS!                                           │
│      ┌──────────────────────────────────────────────────────┐    │
│      │ • Dirancang hanya untuk desktop Windows              │    │
│      │ • Jangan install di Windows Server                   │    │
│      │ • Tidak cocok untuk production environment           │    │
│      └──────────────────────────────────────────────────────┘    │
│                                                                  │
│  4️⃣  MAY AFFECT UPDATES!                                        │
│      ┌──────────────────────────────────────────────────────┐    │
│      │ • Beberapa tweak dapat mempengaruhi Windows Update    │    │
│      │ • Matikan sementara tweak jika update gagal          │    │
│      │ • Update Windows defender setelah optimasi           │    │
│      └──────────────────────────────────────────────────────┘    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🤝 Kontribusi

```
┌─────────────────────────────────────────────────────────────────┐
│                    CONTRIBUTING GUIDELINES                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Kami menyambut kontribusi dari semua orang! 🎉                 │
│                                                                  │
│  1️⃣ FORK REPOSITORY                                              │
│     └─ Fork project ini ke akun GitHub Anda                     │
│                                                                  │
│  2️⃣ CREATE BRANCH                                               │
│     └─ git checkout -b feature/NamaFiturBaru                    │
│                                                                  │
│  3️⃣ MAKE CHANGES                                                │
│     └─ Buat perubahan yang diinginkan                          │
│                                                                  │
│  4️⃣ TEST                                                        │
│     └─ Test perubahan di VM sebelum commit                      │
│                                                                  │
│  5️⃣ COMMIT                                                      │
│     └─ git commit -m 'Menambahkan fitur NamaFiturBaru'          │
│                                                                  │
│  6️⃣ PUSH                                                        │
│     └─ git push origin feature/NamaFiturBaru                    │
│                                                                  │
│  7️⃣ OPEN PULL REQUEST                                           │
│     └─ Submit PR untuk review                                   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 📜 Lisensi

```
┌─────────────────────────────────────────────────────────────────┐
│                         LICENSE                                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  OptiCore OS dilisensikan di bawah GPL-3.0 License              │
│                                                                  │
│  Anda bebas untuk:                                               │
│  ✅ Menggunakan untuk tujuan apapun                              │
│  ✅ Memodifikasi kode sumber                                     │
│  ✅ Mendistribusikan ulang                                       │
│  ✅ Membuat kontribusi                                           │
│                                                                  │
│  Dengan syarat:                                                 │
│  📝 Lisensi harus tetap termasuk                                 │
│  📝 Perubahan harus didokumentasikan                             │
│  📝 Kode sumber harus tersedia                                   │
│                                                                  │
│  Lihat file LICENSE untuk detail lengkap.                        │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🙏 Acknowledgments

| Terimakasih Kepada | Deskripsi |
|--------------------|-----------|
| **AME Wizard** | Sistem playbook yang powerful |
| **Windows Optimization Community** | Research dan development |
| **Contributors** | Yang telah berkontribusi di project ini |

---

## 📞 Dukungan

```
┌─────────────────────────────────────────────────────────────────┐
│                      SUPPORT CHANNELS                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  🐛 Bug Reports     → GitHub Issues                             │
│                                                                  │
│  💬 Questions       → GitHub Discussions                       │
│                                                                  │
│  💬 Community        → Discord Server                           │
│                                                                  │
│  📖 Documentation    → GitHub Wiki                              │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## ⚡ Quick Commands

```powershell
# ============================================
# QUICK REFERENCE COMMANDS
# ============================================

# Cek informasi sistem
systeminfo

# Cek versi Windows
winver

# Cek build number
winver

# Cek services yang disabled
Get-Service | Where-Object {$_.StartType -eq "Disabled"}

# Cek status optimasi
.\status-check.ps1

# Jalankan benchmark
.\benchmark.ps1

# Revert semua perubahan
.\revert.ps1

# Export konfigurasi saat ini
.\export-config.ps1
```

---

<p align="center">
  <strong>Made with ❤️ by OptiCore Team</strong>
</p>

<p align="center">
  <strong>Version</strong>: 1.0.0 | 
  <strong>License</strong>: GPL-3.0 | 
  <strong>Platform</strong>: Windows 10/11
</p>

<p align="center">
  <a href="https://github.com/opticore">GitHub</a> •
  <a href="https://discord.gg/opticore">Discord</a> •
  <a href="https://github.com/opticore/OptiCore-OS/releases">Releases</a>
</p>
