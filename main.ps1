# Script: main.ps1
. ".\scripts\monitor.ps1"

# Variables
$settings = Import-PowerShellDataFile ".\scripts\settings.psd1"
$dataDir = $settings.DataCacheLocation
$soundDir = $settings.SoundCacheLocation
$objectDir = "$dataDir\objectcache"
$textureDir = "$dataDir\texturecache"
$otherAssetsDir = "$dataDir\cache"
$global:DataCacheLocation = "Default Data Location"
$global:SoundCacheLocation = "Default Sound Location"
$latestTexture = $null
$latestObject = $null
$latestSound = $null
$latestOther = $null

# Function Initialize Console
function Initialize-Console {
    [Console]::ForegroundColor = [ConsoleColor]::White
    [Console]::BackgroundColor = [ConsoleColor]::DarkGray
    [Console]::Clear() 
    Write-Host "`nReportNewAssets Started....`n`n"
    Start-Sleep -Seconds 1
}

# Function Log Error
function Log-Error {
    param(
        [Parameter(Mandatory)]
        [System.Management.Automation.ErrorRecord]$ErrorRecord
    )
    $logFilePath = ".\Error-Crash.Log"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Extracting detailed information from the error record
    $scriptName = $ErrorRecord.InvocationInfo.ScriptName
    $functionName = $ErrorRecord.InvocationInfo.MyCommand
    $line = $ErrorRecord.InvocationInfo.ScriptLineNumber
    $message = $ErrorRecord.Exception.Message
    $stackTrace = $ErrorRecord.ScriptStackTrace
    $command = $ErrorRecord.InvocationInfo.Line

    # Creating the log entry with additional details
    $logEntry = "${timestamp}: [Script: $scriptName] [Function: $functionName] [Line: $line] [Command: $command] Error: $message`nStack Trace: $stackTrace"

    try {
        Add-Content -Path $logFilePath -Value $logEntry
    }
    catch {
        Write-Host "Error logging failed: $_"
    }
}



# Function Show Menu
function Show-Menu {
    $exitMenu = $false
    while (-not $exitMenu) {
        Set-ConsoleColor
        Clear-Host
        Write-Host "`n                      -= Report New Assets =-`n`n`n`n`n`n"
        Write-Host "                    1. Set Data Cache Location`n"
        Write-Host "                    2. Set Sound Cache Location`n"
        Write-Host "                    3. Start Monitoring Assets`n`n`n`n`n"
        Write-Host -NoNewline "`nSelect, Menu Options 1-3, Exit Program=X: "
        $input = Read-Host
        switch ($input) {
            "1" { Set-DataCacheLocation }
            "2" { Set-SoundCacheLocation }
            "3" { Start-MonitoringAssets }
            "x" { $exitMenu = $true }
            default { Write-Host "`nInvalid choice, please try again." -ForegroundColor Red }
        }
    }
}


# Function Load Settings
function Load-Settings {
    $settings = Import-PowerShellDataFile ".\scripts\settings.psd1"
    return $settings
}

# Function Save Settings
function Save-Settings {
    param (
        [string]$dataCacheLocation,
        [string]$soundCacheLocation
    )
    $content = "@{`n" +
              "`tDataCacheLocation = `"$dataCacheLocation`"`n" +
              "`tSoundCacheLocation = `"$soundCacheLocation`"`n" +
              "}"
    $content | Out-File -FilePath ".\scripts\settings.psd1" -Encoding UTF8
}


# Function Set Datacachelocation
function Set-DataCacheLocation {
    Write-Host -NoNewline "Enter new Data Cache Location: "
    $newLocation = Read-Host
    $settings = Load-Settings
    Save-Settings -dataCacheLocation $newLocation -soundCacheLocation $settings.SoundCacheLocation
    Write-Host "Data Cache Location updated."
}


# Function Set Soundcachelocation
function Set-SoundCacheLocation {
    Write-Host -NoNewline "Enter new Sound Cache Location: "
    $newLocation = Read-Host
    $settings = Load-Settings
    Save-Settings -dataCacheLocation $settings.DataCacheLocation -soundCacheLocation $newLocation
    Write-Host "Sound Cache Location updated."
}


# Function Set Consolecolor
function Set-ConsoleColor {
    [Console]::ForegroundColor = [ConsoleColor]::White
    [Console]::BackgroundColor = [ConsoleColor]::DarkGray
}

# Entry Point
try {
    Initialize-Console
    Show-Menu # This will display the menu and handle user inputs
} catch {
    Log-Error -ErrorRecord $_
    Write-Host "An unexpected error occurred."
}
