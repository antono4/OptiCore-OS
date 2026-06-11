# 📝 OptiCore OS - Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [1.0.0] - 2026-06-11

### Added

#### Core Scripts
- `optimize-core.ps1` - Core system optimizations
- `optimize-privacy.ps1` - Privacy enhancements and telemetry removal
- `optimize-security.ps1` - Security hardening

#### Gaming Scripts
- `optimize-gaming.ps1` - Gaming-specific optimizations
  - Game DVR disabled
  - Game Mode enabled
  - Hardware-accelerated GPU scheduling
  - GPU performance optimization
  - Network latency reduction
  - CPU core parking disabled

#### Battery Scripts
- `optimize-battery.ps1` - Battery optimization for laptops
  - Battery Saver power plan
  - USB selective suspend
  - Bluetooth disabled
  - WiFi power saving
  - Processor power management
  - Background apps disabled

#### Network Scripts
- `optimize-network.ps1` - Network and DNS optimization
  - TCP parameter tuning
  - RSS enabled
  - DNS optimization (Google/Cloudflare)
  - NetBIOS disabled
  - SMB2 optimization
  - Winsock reset

#### Utility Scripts
- `revert.ps1` - Complete rollback script
- `benchmark.ps1` - System benchmarking
- `status-check.ps1` - Optimization status checker
- `export-config.ps1` - Configuration export

#### Registry Tweaks
- `01-core.reg` - Core system registry tweaks
- `02-privacy.reg` - Privacy registry settings
- `03-security.reg` - Security registry settings
- `04-performance.reg` - Performance registry settings
- `05-gaming.reg` - Gaming registry tweaks
- `06-network.reg` - Network registry tweaks
- `07-ui.reg` - UI/UX registry tweaks
- `08-storage.reg` - Storage registry tweaks

#### Documentation
- `README.md` - Main documentation
- `PROJECT.md` - Project specification
- `docs/INSTALL.md` - Installation guide
- `docs/TROUBLESHOOT.md` - Troubleshooting guide
- `docs/CHANGELOG.md` - This changelog
- `docs/CONTRIBUTING.md` - Contribution guidelines

#### Build Tools
- `build-playbook.cmd` - Windows build script
- `build-playbook.sh` - Linux/macOS build script
- `push-to-github.sh` - GitHub push script
- `push-to-github.bat` - Windows GitHub push script

#### AME Wizard
- `playbook.conf` - AME Wizard configuration
- `Configuration/tweaks.yml` - YAML tweaks file

### Features

#### Performance
- High Performance power plan
- Network latency reduction (5-15ms)
- Game Mode enabled
- TCP tuning
- Prefetch optimization
- Disk I/O optimization

#### Privacy
- Complete telemetry removal
- Advertising ID disabled
- Cortana disabled
- Location tracking blocked
- Activity history disabled
- Hosts file blocking

#### Security
- SmartScreen enabled (block mode)
- Maximum UAC settings
- Windows Defender active
- Firewall enabled
- SMBv1 disabled
- Secure Boot check

#### Usability
- Visual effects disabled
- AutoPlay disabled
- Thumbnails optimized
- Notifications minimized
- Hibernate disabled

---

## [Unreleased]

### Planned for Future Releases

- [ ] Pre-compiled executable versions
- [ ] GUI interface for script management
- [ ] Automatic backup before optimization
- [ ] Selective optimization modules
- [ ] Dark mode theme support
- [ ] Multilingual support

---

## Version History

| Version | Date | Status |
|---------|------|--------|
| 1.0.0 | 2026-06-11 | ✅ Stable |

---

**Note:** This project follows [Semantic Versioning](https://semver.org/).

For detailed changes, see [GitHub Releases](https://github.com/antono4/OptiCore-OS/releases).