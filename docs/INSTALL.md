# 📖 OptiCore OS - Installation Guide

## Prerequisites

Before installing OptiCore OS, ensure your system meets these requirements:

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| **OS** | Windows 10 (2004+) | Windows 11 |
| **Architecture** | x64 (64-bit) | x64 |
| **RAM** | 2 GB | 8 GB+ |
| **Disk Space** | 1 GB free | 10 GB+ free |
| **Admin Rights** | ✅ Required | ✅ Required |

---

## Installation Methods

### Method 1: AME Wizard (Recommended)

AME Wizard allows you to build and apply the playbook without manual scripting.

#### Step 1: Download AME Wizard

1. Visit [https://amelimes.com/](https://amelimes.com/)
2. Download the latest AME Wizard version
3. Extract the downloaded archive

#### Step 2: Build the Playbook

**For Windows:**
```cmd
cd src\playbook
build-playbook.cmd
```

**For Linux/macOS:**
```bash
cd src/playbook
chmod +x build-playbook.sh
./build-playbook.sh
```

This will create `OptiCoreOS.playbook` in the playbook directory.

#### Step 3: Apply the Playbook

1. Run AME Wizard
2. Click "Load Playbook"
3. Select `OptiCoreOS.playbook`
4. Enter password: `opticore`
5. Click "Apply"
6. Wait for completion (10-30 minutes)
7. Reboot when prompted

---

### Method 2: Manual Scripts

This method is for users who want to apply optimizations selectively.

#### Step 1: Prepare PowerShell

1. Open PowerShell as **Administrator**
2. Set execution policy:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

#### Step 2: Run Scripts

Run scripts in this order:

```powershell
# 1. Core Optimizations (Required)
.\src\playbook\Executables\optimize-core.ps1

# 2. Privacy Enhancements (Recommended)
.\src\playbook\Executables\optimize-privacy.ps1

# 3. Security Hardening (Recommended)
.\src\playbook\Executables\optimize-security.ps1

# 4. Gaming Optimizations (Optional)
.\src\playbook\Executables\optimize-gaming.ps1

# 5. Battery Optimization (Optional - Laptops only)
.\src\playbook\Executables\optimize-battery.ps1

# 6. Network Optimization (Optional)
.\src\playbook\Executables\optimize-network.ps1
```

#### Step 3: Reboot

After running scripts, reboot your system.

---

## Quick Start

For a quick installation with all optimizations:

```powershell
# Clone repository
git clone https://github.com/antono4/OptiCore-OS.git
cd OptiCore-OS

# Run all optimizations
cd src\playbook\Executables
.\optimize-core.ps1
.\optimize-privacy.ps1
.\optimize-security.ps1

# Reboot
Restart-Computer
```

---

## Post-Installation

### Verify Installation

Run the status check script:

```powershell
.\src\playbook\Executables\status-check.ps1
```

### Benchmark Your System

```powershell
.\src\playbook\Executables\benchmark.ps1
```

### Export Configuration

```powershell
.\src\playbook\Executables\export-config.ps1
```

---

## Troubleshooting

### Script Won't Run

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Need to Revert

```powershell
.\src\playbook\Executables\revert.ps1
```

---

**Need Help?** Open an issue on [GitHub](https://github.com/antono4/OptiCore-OS/issues)