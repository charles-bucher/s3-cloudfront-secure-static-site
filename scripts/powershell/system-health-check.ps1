<#
.SYNOPSIS
    Comprehensive System Health Check and Monitoring Script

.DESCRIPTION
    Monitors system health including CPU, RAM, disk usage, services, and event logs.
    Generates detailed reports and can send alerts when thresholds are exceeded.
    Perfect for proactive IT support and automated monitoring.

.PARAMETER ReportPath
    Path to save the health check report

.PARAMETER SendEmail
    Switch to enable email alerts

.PARAMETER EmailTo
    Email address to send alerts to

.PARAMETER CPUThreshold
    CPU usage percentage threshold for alerts (default: 80)

.PARAMETER MemoryThreshold
    Memory usage percentage threshold for alerts (default: 85)

.PARAMETER DiskThreshold
    Disk usage percentage threshold for alerts (default: 90)

.EXAMPLE
    .\system-health-check.ps1

.EXAMPLE
    .\system-health-check.ps1 -ReportPath "C:\Reports\health.html" -SendEmail -EmailTo "admin@company.com"

.NOTES
    Author: TechOps Automation Lab
    Version: 1.0
#>

[CmdletBinding()]
param(
    [string]$ReportPath = "C:\Reports\SystemHealth_$(Get-Date -Format 'yyyyMMdd_HHmmss').html",    [switch]$SendEmail,
    [string]$EmailTo,
    [int]$CPUThreshold = 80,
    [int]$MemoryThreshold = 85,
    [int]$DiskThreshold = 90
)

# Initialize results
$healthReport = @{
    Timestamp = Get-Date
    ComputerName = $env:COMPUTERNAME
    Alerts = @()
    Status = "HEALTHY"
}

Write-Host "`n=== System Health Check Started ===" -ForegroundColor Cyan
Write-Host "Computer: $($env:COMPUTERNAME)" -ForegroundColor Cyan
Write-Host "Timestamp: $(Get-Date)" -ForegroundColor Cyan
Write-Host "=========================================`n" -ForegroundColor Cyan

# Function to check CPU usage
function Get-CPUUsage {
    Write-Host "[1/6] Checking CPU Usage..." -ForegroundColor Yellow
    
    try {
        $cpuUsage = Get-Counter '\Processor(_Total)\% Processor Time' -SampleInterval 2 -MaxSamples 3 |
                    Select-Object -ExpandProperty CounterSamples |
                    Measure-Object -Property CookedValue -Average |
                    Select-Object -ExpandProperty Average
        
        $cpuUsage = [Math]::Round($cpuUsage, 2)
        
        $status = if ($cpuUsage -gt $CPUThreshold) { "WARNING" } else { "OK" }
        $color = if ($cpuUsage -gt $CPUThreshold) { "Red" } else { "Green" }        
        Write-Host "  CPU Usage: $cpuUsage% - Status: $status" -ForegroundColor $color
        
        if ($cpuUsage -gt $CPUThreshold) {
            $script:healthReport.Alerts += "CPU usage is high: $cpuUsage%"
            $script:healthReport.Status = "WARNING"
        }
        
        return @{
            Usage = $cpuUsage
            Status = $status
            Threshold = $CPUThreshold
        }
    } catch {
        Write-Host "  Error checking CPU: $($_.Exception.Message)" -ForegroundColor Red
        return $null
    }
}

# Function to check Memory usage
function Get-MemoryUsage {
    Write-Host "`n[2/6] Checking Memory Usage..." -ForegroundColor Yellow
    
    try {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        $totalMemoryGB = [Math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
        $freeMemoryGB = [Math]::Round($os.FreePhysicalMemory / 1MB, 2)
        $usedMemoryGB = [Math]::Round($totalMemoryGB - $freeMemoryGB, 2)
        $memoryUsagePercent = [Math]::Round(($usedMemoryGB / $totalMemoryGB) * 100, 2)
        
        $status = if ($memoryUsagePercent -gt $MemoryThreshold) { "WARNING" } else { "OK" }
        $color = if ($memoryUsagePercent -gt $MemoryThreshold) { "Red" } else { "Green" }        
        Write-Host "  Total Memory: $totalMemoryGB GB" -ForegroundColor Cyan
        Write-Host "  Used Memory: $usedMemoryGB GB" -ForegroundColor Cyan
        Write-Host "  Memory Usage: $memoryUsagePercent% - Status: $status" -ForegroundColor $color
        
        if ($memoryUsagePercent -gt $MemoryThreshold) {
            $script:healthReport.Alerts += "Memory usage is high: $memoryUsagePercent%"
            $script:healthReport.Status = "WARNING"
        }
        
        return @{
            Total = $totalMemoryGB
            Used = $usedMemoryGB
            Free = $freeMemoryGB
            UsagePercent = $memoryUsagePercent
            Status = $status
        }
    } catch {
        Write-Host "  Error checking memory: $($_.Exception.Message)" -ForegroundColor Red
        return $null
    }
}

# Function to check Disk usage
function Get-DiskUsage {
    Write-Host "`n[3/6] Checking Disk Usage..." -ForegroundColor Yellow
    
    try {
        $disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | 
                 Select-Object DeviceID, 
                               @{Name="SizeGB";Expression={[Math]::Round($_.Size/1GB,2)}},
                               @{Name="FreeGB";Expression={[Math]::Round($_.FreeSpace/1GB,2)}},
                               @{Name="UsedGB";Expression={[Math]::Round(($_.Size - $_.FreeSpace)/1GB,2)}},                               @{Name="UsagePercent";Expression={[Math]::Round((($_.Size - $_.FreeSpace)/$_.Size)*100,2)}}
        
        foreach ($disk in $disks) {
            $status = if ($disk.UsagePercent -gt $DiskThreshold) { "WARNING" } else { "OK" }
            $color = if ($disk.UsagePercent -gt $DiskThreshold) { "Red" } else { "Green" }
            
            Write-Host "  Drive $($disk.DeviceID): $($disk.UsagePercent)% used ($($disk.UsedGB)GB / $($disk.SizeGB)GB) - $status" -ForegroundColor $color
            
            if ($disk.UsagePercent -gt $DiskThreshold) {
                $script:healthReport.Alerts += "Disk $($disk.DeviceID) usage is high: $($disk.UsagePercent)%"
                $script:healthReport.Status = "WARNING"
            }
        }
        
        return $disks
    } catch {
        Write-Host "  Error checking disks: $($_.Exception.Message)" -ForegroundColor Red
        return $null
    }
}

# Function to check critical services
function Get-ServiceStatus {
    Write-Host "`n[4/6] Checking Critical Services..." -ForegroundColor Yellow
    
    $criticalServices = @(
        "Spooler",          # Print Spooler
        "wuauserv",         # Windows Update
        "BITS",             # Background Intelligent Transfer
        "Dhcp",             # DHCP Client
        "Dnscache",         # DNS Client
        "EventLog",         # Windows Event Log
        "LanmanWorkstation" # Workstation
    )    
    try {
        $serviceResults = @()
        
        foreach ($serviceName in $criticalServices) {
            $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
            
            if ($service) {
                $status = $service.Status
                $color = if ($status -eq "Running") { "Green" } else { "Red" }
                
                Write-Host "  $($service.DisplayName): $status" -ForegroundColor $color
                
                if ($status -ne "Running" -and $service.StartType -ne "Disabled") {
                    $script:healthReport.Alerts += "Service $($service.DisplayName) is not running"
                    $script:healthReport.Status = "WARNING"
                }
                
                $serviceResults += @{
                    Name = $service.DisplayName
                    Status = $status
                    StartType = $service.StartType
                }
            }
        }
        
        return $serviceResults
    } catch {
        Write-Host "  Error checking services: $($_.Exception.Message)" -ForegroundColor Red
        return $null
    }
}

# Function to check recent errors in Event Log
function Get-RecentErrors {
    Write-Host "`n[5/6] Checking Recent Event Log Errors..." -ForegroundColor Yellow