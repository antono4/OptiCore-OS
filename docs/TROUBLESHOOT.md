# 🔧 OptiCore OS - Troubleshooting Guide

## Common Issues

### 1. Script Won't Execute

**Symptoms:**
- PowerShell shows "script is not digitally signed"
- Execution policy error

**Solutions:**

```powershell
# Option 1: Set execution policy for current user
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Option 2: Unblock the script
Unblock-File -Path ".\optimize-core.ps1"

# Option 3: Bypass for single execution
powershell -ExecutionPolicy Bypass -File ".\optimize-core.ps1"
```

---

### 2. "Access Denied" Error

**Symptoms:**
- Registry modification fails
- Service cannot be stopped

**Solutions:**

1. **Run as Administrator**
   - Right-click PowerShell → "Run as administrator"
   
2. **Check UAC**
   - Ensure UAC is enabled (OptiCore OS keeps UAC active)

3. **Check ownership**
   ```powershell
   # Take ownership of registry key
   takeown /F "HKLM:\SOFTWARE\KeyPath" /A
   icacls "HKLM:\SOFTWARE\KeyPath" /grant Administrators:F
   ```

---

### 3. System Instability After Optimization

**Symptoms:**
- Applications crashing
- System freezes
- Blue screen errors

**Immediate Actions:**

```powershell
# 1. Run revert script immediately
.\src\playbook\Executables\revert.ps1

# 2. If revert fails, boot to Safe Mode
#    - Press F8 during boot → Safe Mode
#    - Run revert.ps1 from Safe Mode

# 3. System restore
rstrui.exe
```

**Prevention:**
- Always create restore point before optimization
- Test in VM first
- Apply one script at a time

---

### 4. Network Connectivity Issues

**Symptoms:**
- No internet connection
- Slow browsing
- DNS errors

**Solutions:**

```powershell
# 1. Flush DNS
ipconfig /flushdns

# 2. Reset network
netsh winsock reset
ipconfig /release
ipconfig /renew

# 3. Check if DNS servers are set correctly
#    Run: optimize-network.ps1 again

# 4. Revert network changes
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpAckFrequency" -Value 2 -Type DWord -Force
```

---

### 5. High CPU Usage

**Symptoms:**
- System running slow
- High fan noise

**Solutions:**

```powershell
# 1. Check for disabled services
Get-Service | Where-Object {$_.StartType -eq "Disabled"}

# 2. Re-enable search indexing
Set-Service -Name WSearch -StartupType Automatic
Start-Service -Name WSearch

# 3. Check power plan
powercfg /list
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e  # Balanced
```

---

### 6. Gaming Issues

**Symptoms:**
- Games crashing
- No performance improvement

**Solutions:**

```powershell
# 1. Re-enable Game DVR if needed
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 1 -Type DWord -Force

# 2. Disable Game Mode
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameMode" -Name "GameModeEnabled" -Value 0 -Type DWord -Force

# 3. Update GPU drivers
#    NVIDIA: https://www.nvidia.com/Download/index.aspx
#    AMD: https://www.amd.com/en/support
```

---

### 7. Windows Update Not Working

**Symptoms:**
- Updates fail to download
- Update service errors

**Solutions:**

```powershell
# 1. Re-enable Windows Update services
Set-Service -Name wuauserv -StartupType Automatic
Start-Service -Name wuauserv

Set-Service -Name BITS -StartupType Automatic
Start-Service -Name BITS

# 2. Run Windows Update troubleshooter
ms-settings:troubleshoot

# 3. Reset Windows Update components
net stop wuauserv
net stop bits
ren %systemroot%\SoftwareDistribution SoftwareDistribution.old
net start wuauserv
net start bits
```

---

### 8. Printer Not Working

**Symptoms:**
- Print spooler errors
- Cannot find printer

**Solutions:**

```powershell
# 1. Re-enable print spooler
Set-Service -Name Spooler -StartupType Automatic
Start-Service -Name Spooler

# 2. Check if service is running
Get-Service Spooler

# 3. Restart if needed
Restart-Service Spooler
```

---

## Emergency Recovery

### System Restore

1. Boot to Advanced Startup Options
   - Settings → Update & Security → Recovery → Advanced startup
2. Select "System Restore"
3. Choose restore point before OptiCore OS installation

### Safe Mode Revert

```powershell
# Boot to Safe Mode
# Open PowerShell as Admin
cd C:\Users\YourUser\Downloads\OptiCore-OS\src\playbook\Executables
.\revert.ps1
```

### Complete Reinstall

If all else fails:
1. Backup important files
2. Reset Windows:
   - Settings → Update & Security → Recovery → Reset this PC

---

## Getting Help

### Before Posting an Issue

1. Run status check:
   ```powershell
   .\status-check.ps1
   ```

2. Run benchmark:
   ```powershell
   .\benchmark.ps1
   ```

3. Export configuration:
   ```powershell
   .\export-config.ps1
   ```

4. Include in your report:
   - Windows version
   - Error messages
   - Output from status-check.ps1

### Create GitHub Issue

Visit: https://github.com/antono4/OptiCore-OS/issues/new

---

## Known Limitations

| Feature | Limitation |
|---------|------------|
| **Server OS** | Not supported - for desktop Windows only |
| **Windows 7/8** | Not supported - requires Windows 10+ |
| **域 (Domain)** | Some features may conflict with Group Policy |
| **BitLocker** | Ensure recovery key is available before optimization |

---

**Still stuck?** [Open an issue](https://github.com/antono4/OptiCore-OS/issues) with details!