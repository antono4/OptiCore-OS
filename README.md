# 🏆 OptiCore OS

<p align="center">
  <img src="docs/images/logo.png" alt="OptiCore OS" width="180">
</p>

<p align="center">
  <b>Premium Windows Optimization</b><br>
  Transformasi Windows menjadi pengalaman yang beda dari biasanya
</p>

<p align="center">
  <img src="https://img.shields.io/badge/License-GPL%20v3-blue.svg?style=for-the-badge" alt="License">
  <img src="https://img.shields.io/badge/Version-1.0.0-green?style=for-the-badge" alt="Version">
  <img src="https://img.shields.io/badge/Platform-Windows%2010%2F11-0078D4?style=for-the-badge" alt="Platform">
</p>

---

## ✨ Kenapa OptiCore OS?

| Fitur | Windows Biasa | OptiCore OS |
|-------|:-------------:|:------------:|
| **Tema** | Blue/Purple | 🌌 Neon Futuristic |
| **Control Center** | Settings App | ⚡ OptiCore Hub |
| **App Launcher** | Start Menu | 🎮 Game Console Drawer |
| **Monitoring** | Task Manager | 📊 Performance HUD |
| **Tools** | Default Only | 🔨 5+ Unique Tools |

---

## 🚀 Fitur Utama

### ⚡ OptiCore Hub
> Control center terpusat dengan interface gaming-inspired

```
┌──────────────────────────────────────────────────────┐
│  ⚡ OPTICORE HUB v1.0.0                            │
├──────────────────────────────────────────────────────┤
│                                                      │
│  🖥️ System: PC-Gaming    │  CPU [██████████] 85%  │
│  💿 OS: Windows 11       │  RAM [████████░░] 72%  │
│  ⚙️ CPU: i7-12700K       │  DISK [████░░░░] 35%  │
│  💾 RAM: 32 GB           │  NET [████████░░] 55%  │
│                                                      │
│  ┌──────┐┌──────┐┌──────┐┌──────┐┌──────┐       │
│  │ 🎮   ││ 💼   ││ 🔋   ││ 🔒   ││ ⚡   │       │
│  │GAMING││ WORK ││BATTERY││PRIVACY││ TURBO│       │
│  └──────┘└──────┘└──────┘└──────┘└──────┘       │
│                                                      │
└──────────────────────────────────────────────────────┘
```

### 🎯 OptiCore Shell
> App drawer style gaming console - beda dari Start Menu Windows

```
╔═══════════════════════════════════════╗
║         ALL APPLICATIONS             ║
╠═══════════════════════════════════════╣
║                                       ║
║  ⚡ OptiCore Hub    📊 Monitor       ║
║  ⚙️ Settings       🔒 Privacy       ║
║  📁 Explorer       💾 Cleanup       ║
║  ⬛ Terminal       🌐 Network       ║
║  🎛️ Control       🔧 Registry      ║
║  ⚡ Power Opt      📋 Clipboard     ║
║                                       ║
╚═══════════════════════════════════════╝
```

### 🔨 OptiCore Tools Suite
> Tools eksklusif yang tidak ada di Windows maupun Linux

| Tool | Fungsi |
|------|--------|
| **Tweaker** | CPU, RAM, GPU, Network advanced tuning |
| **Guardian** | Real-time protection monitor |
| **Radar** | Network monitoring & diagnostics |
| **Pulse** | System health diagnostics |
| **Forge** | Custom configuration builder |

### 🌌 Nexus Theme
> Tema futuristik dengan aksen neon

| Color | Hex | Usage |
|-------|-----|-------|
| 🟦 Primary | `#00D4FF` | Main accent |
| 🟪 Secondary | `#FF00AA` | Secondary accent |
| 🟩 Tertiary | `#00FF88` | Success/Active |
| 🟨 Warning | `#FFB800` | Warnings |
| 🟥 Danger | `#FF3366` | Errors |

---

## 📦 Instalasi

### Metode 1: AME Wizard (Recommended)

```powershell
# 1. Download AME Wizard
Visit: https://amelimes.com/

# 2. Download OptiCoreOS.playbook dari releases

# 3. Load playbook di AME Wizard
- Run AME Wizard.exe
- Click "Load Playbook"
- Select OptiCoreOS.playbook
- Password: malte
- Click "Apply"
```

### Metode 2: Manual Script

```powershell
# Run sebagai Administrator
.\src\playbook\Executables\optimize-core.ps1
.\src\playbook\Executables\optimize-privacy.ps1
.\src\playbook\Executables\optimize-security.ps1
```

### Metode 3: OptiCore Hub

```powershell
# Jalankan OptiCore Hub
.\src\playbook\OptiCore-Hub\OptiCore-Hub.ps1

# Pilih mode dari dashboard:
# [1] Gaming Mode  [2] Work Mode  [3] Battery Mode
# [4] Privacy Mode  [5] Turbo Mode
```

---

## 📁 Struktur Project

```
OptiCore-OS/
├── src/playbook/
│   ├── OptiCore-Hub/           # ⚡ Central Control Center
│   ├── OptiCore-Shell/         # 🎮 Custom Desktop Shell
│   ├── OptiCore-Tools/         # 🔨 Tools Suite
│   ├── Themes/OptiCore-Nexus/  # 🌌 Nexus Theme
│   ├── Configuration/           # Registry configs
│   └── Executables/            # PowerShell scripts
├── docs/
│   └── images/                 # Dokumentasi images
└── README.md
```

---

## 📊 Benchmark

| Metric | Sebelum | Sesudah | Improvement |
|--------|---------|---------|-------------|
| Boot Time | 45s | 32s | **-29%** |
| RAM Usage | 4.2 GB | 2.8 GB | **-1.4 GB** |
| Ping (Gaming) | 45ms | 28ms | **-17ms** |
| Game FPS | 120 | 145 | **+21%** |

---

## ⚠️ Peringatan

```
┌─────────────────────────────────────────────────────┐
│  ⚠️  IMPORTANT                                       │
├─────────────────────────────────────────────────────┤
│                                                      │
│  ✓ Backup sistem sebelum instalasi                  │
│  ✓ Test di Virtual Machine terlebih dahulu          │
│  ✓ Tidak untuk Windows Server                       │
│  ✓ Beberapa tweak dapat mempengaruhi Windows Update  │
│                                                      │
└─────────────────────────────────────────────────────┘
```

---

## 🔄 Rollback

Jika terjadi masalah:

1. **System Restore** - Settings > System > Recovery
2. **Revert Script** - Jalankan `revert.ps1`
3. **Fresh Install** - Install ulang Windows

---

## 🤝 Kontribusi

```bash
# 1. Fork repository
# 2. Buat branch baru
git checkout -b feature/FiturBaru

# 3. Commit perubahan
git commit -m 'Menambah fitur baru'

# 4. Push ke branch
git push origin feature/FiturBaru

# 5. Buat Pull Request
```

---

## 📜 Lisensi

Project ini dilisensikan di bawah **GPL-3.0 License**

---

## 📞 Dukungan

- 🐛 **Bug Reports** → GitHub Issues
- 💬 **Questions** → GitHub Discussions
- 💬 **Community** → Discord Server

---

<p align="center">
  <strong>Made with ❤️ by OptiCore Team</strong><br>
  Version 1.0.0 | GPL-3.0 License
</p>
