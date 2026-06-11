# 🤝 OptiCore OS - Contributing Guide

Thank you for your interest in contributing to OptiCore OS!

## Ways to Contribute

### 🐛 Report Bugs
Found a bug? Please [open an issue](https://github.com/antono4/OptiCore-OS/issues/new) with:
- Windows version
- Error message or screenshot
- Steps to reproduce
- Expected vs actual behavior

### 💡 Suggest Features
Have an idea for improvement? [Open a feature request](https://github.com/antono4/OptiCore-OS/issues/new?labels=enhancement) with:
- Clear description
- Use case explanation
- Any relevant research

### 🔧 Contribute Code

#### Prerequisites
- Windows 10/11 (for testing)
- PowerShell 5.1+
- Git
- Basic understanding of Windows optimization

#### Development Setup

```bash
# 1. Fork the repository
# 2. Clone your fork
git clone https://github.com/YOUR_USERNAME/OptiCore-OS.git
cd OptiCore-OS

# 3. Create a branch
git checkout -b feature/your-feature-name

# 4. Make changes
#    Edit scripts, add features, fix bugs

# 5. Test thoroughly
#    - Test on VM first
#    - Run status-check.ps1 to verify

# 6. Commit
git add .
git commit -m "Add: description of your change"

# 7. Push
git push origin feature/your-feature-name

# 8. Open Pull Request
```

#### Code Style

**PowerShell Guidelines:**
- Use descriptive variable names
- Add comments for complex logic
- Include error handling
- Follow [PowerShell best practices](https://docs.microsoft.com/en-us/powershell/scripting/developer/best-practices)

**Example:**
```powershell
# Good
$gameDvrEnabled = Get-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled"
if ($gameDvrEnabled.GameDVR_Enabled -eq 1) {
    Write-Log "Game DVR is enabled"
}

# Avoid
$a = Get-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled"
if ($a.GameDVR_Enabled -eq 1) { Write-Log "Enabled" }
```

#### Registry Guidelines
- Use clear comments
- Group related settings
- Test in VM before submitting

#### Documentation Guidelines
- Use Markdown formatting
- Include code examples
- Add screenshots if helpful
- Translate to English for international contributions

---

## Pull Request Process

1. **Update Documentation** - Add/update docs for any new features
2. **Test in VM** - Ensure changes don't break anything
3. **Run Status Check** - Verify optimization status
4. **Describe Changes** - Clear PR description with what/why/how
5. **Link Issues** - Reference related issues

---

## Areas for Contribution

### High Priority
- [ ] Gaming optimizations for specific games
- [ ] Hardware-specific optimizations (Intel, AMD, NVIDIA)
- [ ] Bug fixes and compatibility improvements

### Medium Priority
- [ ] Additional registry tweaks
- [ ] More utility scripts
- [ ] Translations (Indonesian, English, etc.)

### Low Priority
- [ ] GUI interface
- [ ] Pre-compiled executables
- [ ] Automated testing

---

## Community Guidelines

### Be Respectful
- Use welcoming language
- Be inclusive
- Constructive feedback only

### Be Helpful
- Answer questions when possible
- Share knowledge
- Help newcomers

### Be Transparent
- Honest about limitations
- Clear about expectations
- Document your work

---

## License

By contributing, you agree that your contributions will be licensed under the [GPL-3.0 License](../LICENSE).

---

## Questions?

- Open an [issue](https://github.com/antono4/OptiCore-OS/issues)
- Check [discussions](https://github.com/antono4/OptiCore-OS/discussions)

---

**Thank you for making OptiCore OS better!** 🙏