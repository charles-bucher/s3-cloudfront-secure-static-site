<#
.SYNOPSIS
    Automated Active Directory User Management Script

.DESCRIPTION
    Creates, modifies, or removes AD user accounts with proper error handling,
    logging, and validation. Perfect for helpdesk automation and bulk user provisioning.

.PARAMETER Action
    Action to perform: Create, Modify, Delete, or BulkCreate

.PARAMETER Username
    Username for the user account

.PARAMETER FirstName
    User's first name

.PARAMETER LastName
    User's last name

.PARAMETER Email
    User's email address

.PARAMETER Department
    Department name

.PARAMETER CSVPath
    Path to CSV file for bulk user creation

.EXAMPLE
    .\user-management.ps1 -Action Create -Username jsmith -FirstName John -LastName Smith -Email jsmith@company.com -Department IT

.EXAMPLE
    .\user-management.ps1 -Action BulkCreate -CSVPath "C:\users\newusers.csv"

.NOTES
    Author: TechOps Automation Lab
    Version: 1.0
    Requires: Active Directory PowerShell Module
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('Create','Modify','Delete','BulkCreate','ListUsers')]
    [string]$Action,
    
    [Parameter(Mandatory=$false)]
    [string]$Username,
    
    [Parameter(Mandatory=$false)]
    [string]$FirstName,    
    [Parameter(Mandatory=$false)]
    [string]$LastName,
    
    [Parameter(Mandatory=$false)]
    [string]$Email,
    
    [Parameter(Mandatory=$false)]
    [string]$Department,
    
    [Parameter(Mandatory=$false)]
    [string]$CSVPath,
    
    [Parameter(Mandatory=$false)]
    [string]$LogPath = "C:\Logs\UserManagement.log"
)

# Import Active Directory module
try {
    Import-Module ActiveDirectory -ErrorAction Stop
    Write-Host "[✓] Active Directory module loaded successfully" -ForegroundColor Green
} catch {
    Write-Host "[✗] Failed to load Active Directory module: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Function to write logs
function Write-Log {
    param(
        [string]$Message,
        [ValidateSet('INFO','WARNING','ERROR','SUCCESS')]
        [string]$Level = 'INFO'
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"
    
    # Create log directory if it doesn't exist
    $logDir = Split-Path -Path $LogPath -Parent    if (!(Test-Path $logDir)) {
        New-Item -ItemType Directory -Path $logDir -Force | Out-Null
    }
    
    # Write to log file
    Add-Content -Path $LogPath -Value $logMessage
    
    # Console output with color
    switch ($Level) {
        'INFO'    { Write-Host $logMessage -ForegroundColor Cyan }
        'WARNING' { Write-Host $logMessage -ForegroundColor Yellow }
        'ERROR'   { Write-Host $logMessage -ForegroundColor Red }
        'SUCCESS' { Write-Host $logMessage -ForegroundColor Green }
    }
}

# Function to generate secure random password
function New-RandomPassword {
    param(
        [int]$Length = 12
    )
    
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"
    $password = -join ((1..$Length) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
    return $password
}

# Function to create a new user
function New-ADUserAccount {
    param(
        [string]$Username,
        [string]$FirstName,
        [string]$LastName,
        [string]$Email,
        [string]$Department
    )    
    try {
        # Check if user already exists
        if (Get-ADUser -Filter "SamAccountName -eq '$Username'" -ErrorAction SilentlyContinue) {
            Write-Log "User $Username already exists" -Level WARNING
            return $false
        }
        
        # Generate secure password
        $password = New-RandomPassword
        $securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
        
        # Create user account
        $userParams = @{
            Name = "$FirstName $LastName"
            GivenName = $FirstName
            Surname = $LastName
            SamAccountName = $Username
            UserPrincipalName = "$Username@domain.com"
            EmailAddress = $Email
            Department = $Department
            AccountPassword = $securePassword
            Enabled = $true
            ChangePasswordAtLogon = $true
            Path = "OU=Users,DC=domain,DC=com"  # Change this to your OU
        }
        
        New-ADUser @userParams -ErrorAction Stop
        
        Write-Log "Successfully created user: $Username" -Level SUCCESS
        Write-Log "Temporary password: $password (User must change at first logon)" -Level INFO
        
        return $true
    } catch {
        Write-Log "Failed to create user $Username : $($_.Exception.Message)" -Level ERROR
        return $false
    }
}

# Function to delete a user
function Remove-ADUserAccount {
    param([string]$Username)
    
    try {
        $user = Get-ADUser -Filter "SamAccountName -eq '$Username'" -ErrorAction Stop
        
        if ($user) {
            Remove-ADUser -Identity $Username -Confirm:$false -ErrorAction Stop
            Write-Log "Successfully deleted user: $Username" -Level SUCCESS
            return $true
        } else {
            Write-Log "User $Username not found" -Level WARNING
            return $false
        }
    } catch {
        Write-Log "Failed to delete user $Username : $($_.Exception.Message)" -Level ERROR
        return $false
    }
}

# Function for bulk user creation from CSV
function New-BulkADUsers {
    param([string]$CSVPath)
    
    try {
        if (!(Test-Path $CSVPath)) {
            Write-Log "CSV file not found: $CSVPath" -Level ERROR
            return
        }
        
        $users = Import-Csv -Path $CSVPath
        $successCount = 0
        $failCount = 0        
        foreach ($user in $users) {
            Write-Log "Processing user: $($user.Username)" -Level INFO
            
            $result = New-ADUserAccount `
                -Username $user.Username `
                -FirstName $user.FirstName `
                -LastName $user.LastName `
                -Email $user.Email `
                -Department $user.Department
            
            if ($result) {
                $successCount++
            } else {
                $failCount++
            }
        }
        
        Write-Log "Bulk creation completed. Success: $successCount | Failed: $failCount" -Level SUCCESS
    } catch {
        Write-Log "Bulk creation failed: $($_.Exception.Message)" -Level ERROR
    }
}

# Main execution logic
Write-Log "=== User Management Script Started ===" -Level INFO
Write-Log "Action: $Action" -Level INFO

switch ($Action) {
    'Create' {
        if (-not $Username -or -not $FirstName -or -not $LastName -or -not $Email -or -not $Department) {
            Write-Log "Missing required parameters for user creation" -Level ERROR
            Write-Host "`nUsage: .\user-management.ps1 -Action Create -Username <user> -FirstName <name> -LastName <name> -Email <email> -Department <dept>"
            exit 1
        }
        New-ADUserAccount -Username $Username -FirstName $FirstName -LastName $LastName -Email $Email -Department $Department
    }    
    'Delete' {
        if (-not $Username) {
            Write-Log "Missing username parameter" -Level ERROR
            exit 1
        }
        Remove-ADUserAccount -Username $Username
    }
    
    'BulkCreate' {
        if (-not $CSVPath) {
            Write-Log "Missing CSV path parameter" -Level ERROR
            exit 1
        }
        New-BulkADUsers -CSVPath $CSVPath
    }
    
    'ListUsers' {
        try {
            $users = Get-ADUser -Filter * -Properties Department, EmailAddress | 
                     Select-Object SamAccountName, Name, Department, EmailAddress, Enabled
            $users | Format-Table -AutoSize
            Write-Log "Retrieved $($users.Count) users" -Level SUCCESS
        } catch {
            Write-Log "Failed to list users: $($_.Exception.Message)" -Level ERROR
        }
    }
}

Write-Log "=== User Management Script Completed ===" -Level INFO
