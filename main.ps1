# Script: main.ps1

# Imports
. ".\scripts\monitor.ps1"
. ".\scripts\display.ps1"
. ".\scripts\artwork.ps1"

# Variables
$settings = Import-PowerShellDataFile ".\config\settings.psd1"
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

# Function Load Settings
function Load-Settings {
    $settings = Import-PowerShellDataFile ".\config\settings.psd1"
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
    $content | Out-File -FilePath ".\config\settings.psd1" -Encoding UTF8
}

# Entry Point
try {
    Initialize-Console
    Show-Menu # This will display the menu and handle user inputs
} catch {
    Log-Error -ErrorRecord $_
    Write-Host "An unexpected error occurred."
}
