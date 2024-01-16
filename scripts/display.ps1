# Script: display.ps1

# Function Initialize Console
function Initialize-Console {
    Set-ConsoleColor
    [Console]::Clear() 
    Write-Host "`nProgram Launched....`n`n"
    Start-Sleep -Seconds 1
}

# Function Set Consolecolor
function Set-ConsoleColor {
    [Console]::ForegroundColor = [ConsoleColor]::White
    [Console]::BackgroundColor = [ConsoleColor]::DarkGray
}

# Function Show Menu
function Show-Menu {
    $exitMenu = $false
    while (-not $exitMenu) {
        Set-ConsoleColor
        Clear-Host
        Write-Host "`n                          -= Main Menu =-`n`n`n`n`n`n"
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

# Function Display Assetreport
function Display-AssetReport {
    Set-ConsoleColor
    Clear-Host
    Write-Host "`n                      -= Monitoring Assets =-"
    Write-Host "`nCache/Sound Dir:"
    Write-Host "$dataDir - $(Get-DirectorySize -directoryPath $dataDir)"
    Write-Host "$soundDir - $(Get-DirectorySize -directoryPath $soundDir)"
    
    Write-Host "`nNewest Texture Assets:"
    Display-SingleFile -file $global:latestTexture

    Write-Host "`nNewest Object Assets:"
    Display-SingleFile -file $global:latestObject

    Write-Host "`nNewest Sound Assets:"
    Display-SingleFile -file $global:latestSound

    Write-Host "`nNewest Other Assets:"
    Display-SingleFile -file $global:latestOther

    Write-Host "`nRefresh In 15 Seconds, Press M To Return To Menu..."
}

# Function Set Soundcachelocation
function Set-SoundCacheLocation {
    Write-Host -NoNewline "Enter new Sound Cache Location: "
    $newLocation = Read-Host
    $settings = Load-Settings
    Save-Settings -dataCacheLocation $settings.DataCacheLocation -soundCacheLocation $newLocation
    Write-Host "Sound Cache Location updated."
}

# Function Set Datacachelocation
function Set-DataCacheLocation {
    Write-Host -NoNewline "Enter new Data Cache Location: "
    $newLocation = Read-Host
    $settings = Load-Settings
    Save-Settings -dataCacheLocation $newLocation -soundCacheLocation $settings.SoundCacheLocation
    Write-Host "Data Cache Location updated."
}

# Function Display Singlefile
function Display-SingleFile {
    param ([System.IO.FileInfo]$file)
    if ($file) {
        $size = "{0:N2} KB" -f ($file.Length / 1KB)
        "$($file.Name) - $size"
    } else {
        "No Relevantly Themed Files Exist!"
    }
}

# Function Get Directorysize
function Get-DirectorySize {
    param (
        [string]$directoryPath
    )
    $totalSize = (Get-ChildItem -Path $directoryPath -Recurse -File | Measure-Object -Property Length -Sum).Sum / 1MB
    return "{0:N2} MB" -f $totalSize
}

