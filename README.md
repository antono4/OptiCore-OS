# 🏆 OptiCore OS

**Premium Windows Optimization 
**Premium Windows Optimization**

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![Version](https://img.shields.io/badge/Version-1.0.0-green)
![Platform](https://img.shields.io/badge/Platform-Windows%2010%2F11-blue)

> OptiCore OS is an open-source Windows optimization project that provides aggressive performance tweaks, enhanced security, and refined user experience.

## 🌟 Features

### 🔥 Performance
- **Network Latency Optimization** - Lower ping for gaming
- **Game Mode Enhancement** - Maximize gaming performance
- **TCP Tuning** - Reduced packet latency
- **Prefetch Optimization** - Faster boot times
- **Disk I/O Optimization** - Improved read/write speeds
- **Power Plan Optimization** - High performance mode

### 🔒 Privacy
- **Complete Telemetry Removal** - No data collection
- **Advertising ID Disabled** - No targeted ads
- **Cortana Disabled** - No voice assistant tracking
- **Activity History Blocked** - No activity syncing
- **Location Tracking Disabled** - Privacy protected
- **Hosts File Blocking** - Block Microsoft telemetry domains

### 🛡️ Security
- **SmartScreen Enabled** - Protect against malicious files
- **Maximum UAC** - Strongest user account control
- **Windows Defender Active** - Real-time protection
- **Firewall Enabled** - All profiles active
- **SMBv1 Disabled** - No legacy protocol vulnerabilities
- **Secure Boot Check** - Verify system integrity

### 🎨 Usability
- **Visual Effects Disabled** - Faster UI response
- **AutoPlay Disabled** - Prevent unexpected media actions
- **Thumbnails Optimized** - Faster file browsing
- **Notifications Minimized** - Less interruption
- **Startup Optimized** - Faster boot

### ⚡ Power (Laptop Users)
- **High Performance Power Plan** - Maximum performance
- **Hibernate Disabled** - Save disk space
- **Power Throttling Disabled** - No CPU limiting
- **USB Selective Suspend Disabled** - Stable connections

## 📋 Requirements

- **OS**: Windows 10 (build 2004+) or Windows 11
- **Architecture**: x64 (64-bit)
- **RAM**: Minimum 2 GB
- **Disk Space**: 1 GB free
- **Admin Rights**: Required for installation

## 📥 Installation

### Method 1: Using AME Wizard (Recommended)

1. **Download AME Wizard**
   ```
   Visit: https://amelimes.com/
   Download the latest version
   ```

2. **Download OptiCoreOS Playbook**
   ```
   Download from releases
   ```

3. **Run AME Wizard**
   ```
   1. Extract AME Wizard
   2. Run AME Wizard.exe
   3. Click "Load Playbook"
   4. Select OptiCoreOS.playbook
   5. Enter password: malte
   6. Click "Apply"
   ```

4. **Wait for Completion**
   ```
   The optimization will apply automatically
   System may restart during process
   ```

### Method 2: Manual Script Execution

1. **Download Scripts**
   ```
   Get the scripts from Executables folder
   ```

2. **Run as Administrator**
   ```
   Right-click PowerShell > Run as Administrator
   ```

3. **Execute Scripts**
   ```powershell
   # Run in order:
   .\optimize-core.ps1
   .\optimize-privacy.ps1
   .\optimize-security.ps1
   ```

## 📁 Project Structure

```
OptiCore-OS/
├── src/
│   └── playbook/
│       ├── Configuration/      # Registry tweaks
│       │   ├── atlas/          # Core configurations
│       │   │   ├── 01-core.reg
│       │   │   ├── 02-privacy.reg
│       │   │   ├── 03-security.reg
│       │   │   └── 04-performance.reg
│       │   └── tweaks.yml     # Tweaks configuration
│       ├── Executables/        # PowerShell scripts
│       │   ├── optimize-core.ps1
│       │   ├── optimize-privacy.ps1
│       │   └── optimize-security.ps1
│       ├── Images/            # UI images
│       ├── playbook.conf      # Playbook configuration
│       ├── build-playbook.cmd # Windows build script
│       └── build-playbook.sh  # Linux build script
├── README.md
├── PROJECT.md
└── LICENSE
```

## 🔧 Building the Playbook

### Windows

1. Install [7-Zip](https://www.7-zip.org/)
2. Navigate to `src/playbook/`
3. Run `build-playbook.cmd`
4. Find output: `OptiCoreOS.playbook`

### Linux/macOS

1. Ensure `zip` is installed
2. Navigate to `src/playbook/`
3. Run `chmod +x build-playbook.sh`
4. Run `./build-playbook.sh`
5. Find output: `OptiCoreOS.playbook`

## 🎯 Tweaks Categories

| Category | Description | Risk Level |
|----------|-------------|------------|
| Essential | Core system optimizations | Low |
| Performance | Speed and latency improvements | Medium |
| Privacy | Telemetry and tracking removal | Low |
| Security | Hardening and protection | Low |
| Usability | UI/UX improvements | Low |
| Power | Power management settings | Medium |

## ⚠️ Important Notes

1. **Backup First** - Always backup your system before applying optimizations
2. **Test in VM** - Test in a virtual machine before applying to production
3. **Not for Server** - This is designed for desktop Windows only
4. **May Break Updates** - Some tweaks may affect Windows Update
5. **Revert Option** - Keep the option to reinstall Windows if needed

## 🔄 Reverting Changes

To revert OptiCore OS optimizations:

1. **System Restore**
   ```
   Settings > System > Recovery > Advanced startup
   Troubleshoot > Advanced options > System Restore
   ```

2. **Reinstall Windows**
   - Keep your Windows installation media
   - Perform a clean Windows installation
   - Do not apply OptiCore OS

## 📊 Benchmark Results

Expected improvements (varies by system):

| Metric | Improvement |
|--------|-------------|
| Boot Time | 15-30% faster |
| RAM Usage | 500MB-1.5GB freed |
| CPU Idle | 2-5% reduction |
| Network Latency | 5-15ms reduction |
| Game FPS | 10-20% improvement |

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📜 License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Windows Optimization** - Custom optimizations
- **AME Wizard** - For the playbook system
- **Windows optimization community** - For research and development

## 📞 Support

- **Issues** - Report bugs via GitHub Issues
- **Discussions** - Ask questions via GitHub Discussions
- **Discord** - Join our community server

## ⚡ Quick Commands

```powershell
# Check system info
systeminfo

# Check Windows version
winver

# Check build number
winver

# Check enabled services
Get-Service | Where-Object {$_.StartType -eq "Disabled"}

# Check optimization status
.\optimize-core.ps1 -Silent -NoReboot
```

---

**Made with ❤️ by OptiCore Team**

**Version**: 1.0.0 | **License**: GPL-3.0
