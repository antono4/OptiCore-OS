# ==========================================
# OptiCore OS - Benchmark Script
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Benchmark system performance

param(
    [switch]$Export,
    [string]$OutputFile = "$env:TEMP\OptiCore_Benchmark_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
)

$ErrorActionPreference = "Continue"

Write-Host ""
Write-Host "📊 OptiCore OS - System Benchmark" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

$benchmark = @()
$benchmark += "OptiCore OS - Benchmark Report"
$benchmark += "================================"
$benchmark += "Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$benchmark += ""

# ========== SYSTEM INFO ==========
Write-Host "Collecting system information..." -ForegroundColor Yellow
$benchmark += "[SYSTEM INFO]"
$benchmark += "Computer Name: $env:COMPUTERNAME"
$benchmark += "User: $env:USERNAME"
$benchmark += "OS: $((Get-CimInstance Win32_OperatingSystem).Caption)"
$benchmark += "Version: $((Get-CimInstance Win32_OperatingSystem).Version)"
$benchmark += "Architecture: $((Get-CimInstance Win32_OperatingSystem).OSArchitecture)"
$benchmark += ""

# ========== CPU INFO ==========
Write-Host "Measuring CPU performance..." -ForegroundColor Yellow
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$benchmark += "[CPU]"
$benchmark += "Name: $($cpu.Name)"
$benchmark += "Cores: $($cpu.NumberOfCores)"
$benchmark += "Logical Processors: $($cpu.NumberOfLogicalProcessors)"
$benchmark += "Max Speed: $($cpu.MaxClockSpeed) MHz"
$benchmark += ""

# ========== RAM INFO ==========
Write-Host "Measuring RAM..." -ForegroundColor Yellow
$ram = Get-CimInstance Win32_ComputerSystem
$benchmark += "[RAM]"
$benchmark += "Total: $([math]::Round($ram.TotalPhysicalMemory / 1GB, 2)) GB"
$benchmark += "Available: $([math]::Round($ram.FreePhysicalMemory / 1MB, 2)) MB"
$benchmark += ""

# ========== DISK INFO ==========
Write-Host "Measuring disk performance..." -ForegroundColor Yellow
$disks = Get-CimInstance Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }
$benchmark += "[DISK]"
foreach ($disk in $disks) {
    $benchmark += "Drive $($disk.DeviceID)"
    $benchmark += "  Total: $([math]::Round($disk.Size / 1GB, 2)) GB"
    $benchmark += "  Free: $([math]::Round($disk.FreeSpace / 1GB, 2)) GB"
    $benchmark += "  Used: $([math]::Round((($disk.Size - $disk.FreeSpace) / $disk.Size) * 100, 1))%"
}
$benchmark += ""

# ========== GPU INFO ==========
Write-Host "Measuring GPU..." -ForegroundColor Yellow
$gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1
$benchmark += "[GPU]"
$benchmark += "Name: $($gpu.Name)"
$benchmark += "RAM: $([math]::Round($gpu.AdapterRAM / 1GB, 2)) GB"
$benchmark += "Driver: $($gpu.DriverVersion)"
$benchmark += ""

# ========== NETWORK INFO ==========
Write-Host "Measuring network..." -ForegroundColor Yellow
$networks = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
$benchmark += "[NETWORK]"
foreach ($net in $networks) {
    $benchmark += "Adapter: $($net.Name)"
    $benchmark += "  Speed: $($net.LinkSpeed)"
    $benchmark += "  Status: $($net.Status)"
}
$benchmark += ""

# ========== CPU BENCHMARK ==========
Write-Host "Running CPU benchmark..." -ForegroundColor Yellow
$benchmark += "[CPU BENCHMARK]"
$cpuBenchmark = Measure-Command -Expression {
    $result = 0
    for ($i = 0; $i -lt 1000000; $i++) { $result += $i }
} | Select-Object -ExpandProperty TotalMilliseconds
$benchmark += "Calculation Test: $('{0:N2}' -f $cpuBenchmark) ms"
$benchmark += ""

# ========== DISK BENCHMARK ==========
Write-Host "Running disk benchmark..." -ForegroundColor Yellow
$benchmark += "[DISK BENCHMARK]"
$testFile = "$env:TEMP\benchmark_test.tmp"
$testSize = 100MB
$testData = [byte[]]::new(1MB)
$sw = [System.Diagnostics.Stopwatch]::StartNew()
[System.IO.File]::WriteAllBytes($testFile, $testData * 1)
$sw.Stop()
$writeTime = $sw.ElapsedMilliseconds
$benchmark += "1MB Write: $writeTime ms"

$sw.Restart()
$null = [System.IO.File]::ReadAllBytes($testFile)
$sw.Stop()
$readTime = $sw.ElapsedMilliseconds
$benchmark += "1MB Read: $readTime ms"

Remove-Item $testFile -Force
$benchmark += ""

# ========== MEMORY BENCHMARK ==========
Write-Host "Running memory benchmark..." -ForegroundColor Yellow
$benchmark += "[MEMORY BENCHMARK]"
$sw.Restart()
$memTest = [byte[]]::new(100MB)
$sw.Stop()
$benchmark += "100MB Allocation: $('{0:N2}' -f $sw.ElapsedMilliseconds) ms"
$benchmark += ""

# ========== NETWORK SPEED TEST ==========
Write-Host "Testing network speed..." -ForegroundColor Yellow
$benchmark += "[NETWORK SPEED]"
$pingResult = Test-Connection -ComputerName 8.8.8.8 -Count 4 -ErrorAction SilentlyContinue
if ($pingResult) {
    $avgPing = ($pingResult | Measure-Object -Property ResponseTime -Average).Average
    $benchmark += "Ping to 8.8.8.8: $avgPing ms (avg)"
} else {
    $benchmark += "Ping: Failed"
}
$benchmark += ""

# ========== SERVICES STATUS ==========
Write-Host "Checking services status..." -ForegroundColor Yellow
$benchmark += "[SERVICES STATUS]"
$services = @("DiagTrack", "WSearch", "Themes", "Spooler")
foreach ($svc in $services) {
    $service = Get-Service -Name $svc -ErrorAction SilentlyContinue
    if ($service) {
        $benchmark += "$svc : $($service.Status) ($($service.StartType))"
    }
}
$benchmark += ""

# ========== OPTIMIZATION STATUS ==========
Write-Host "Checking optimization status..." -ForegroundColor Yellow
$benchmark += "[OPTIMIZATION STATUS]"

# Check Game Mode
$gameMode = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameMode" -Name "GameModeEnabled" -ErrorAction SilentlyContinue
$benchmark += "Game Mode: $(if ($gameMode.GameModeEnabled -eq 1) { 'Enabled' } else { 'Disabled' })"

# Check Power Plan
$powerPlan = powercfg /getactivescheme | Select-String "Power Scheme"
$benchmark += "Power Plan: $powerPlan"

# Check Telemetry
$diagTrack = Get-Service -Name DiagTrack -ErrorAction SilentlyContinue
$benchmark += "Telemetry Service: $(if ($diagTrack.StartType -eq 'Disabled') { 'Disabled' } else { 'Enabled' })"

# Check High Performance
$benchmark += ""

# ========== EXPORT ==========
$benchmark | Out-File -FilePath $OutputFile -Encoding UTF8

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "📊 Benchmark Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Results saved to: $OutputFile" -ForegroundColor Cyan
Write-Host ""

# Display summary
Write-Host "Quick Summary:" -ForegroundColor Yellow
Write-Host "  CPU: $($cpu.Name)" -ForegroundColor White
Write-Host "  RAM: $([math]::Round($ram.TotalPhysicalMemory / 1GB, 2)) GB" -ForegroundColor White
Write-Host "  GPU: $($gpu.Name)" -ForegroundColor White
Write-Host "  Disk Free: $([math]::Round($disks[0].FreeSpace / 1GB, 2)) GB" -ForegroundColor White
if ($pingResult) {
    Write-Host "  Ping: $avgPing ms" -ForegroundColor White
}
Write-Host ""

if ($Export) {
    Write-Host "Benchmark exported successfully!" -ForegroundColor Green
}

exit 0