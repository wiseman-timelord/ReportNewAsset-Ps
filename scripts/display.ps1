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
        Show-AsciiArt
		Show-Title
        Write-Host "`n`n`n                    1. Set Data Cache Location`n"
        Write-Host "                    2. Set Sound Cache Location`n"
        Write-Host "                    3. Start Monitoring Assets`n`n`n`n`n"
        Show-Divider
		Write-Host -NoNewline "Select, Menu Options 1-3, Exit Program=X: "
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
    Show-Title
    Write-Host "Monitoring Assets..."

    Write-Host "`nCache/Sound Dir:"

    # Map directory names to labels
    $dirLabels = @{
        "cache" = "General"
        "cef_cache" = "Media"
        "objectcache" = "Objects"
        "texturecache" = "Textures"
    }

    # Define an ordered list of keys
    $orderedKeys = @("cache", "cef_cache", "objectcache", "texturecache")

    # Constructing the directory size string
    $dirSizes = @()
    foreach ($dir in $orderedKeys) {
        $dirPath = Join-Path $dataDir $dir
        if (Test-Path $dirPath) {
            $size = Get-DirectorySize -directoryPath $dirPath
            $label = $dirLabels[$dir]
            $dirSizes += "$label = ${size}MB"
        } else {
            $label = $dirLabels[$dir]
            $dirSizes += "$label = Not Found!"
        }
    }

    # Adding the Sound directory size
    $soundPath = $soundDir
    if (Test-Path $soundPath) {
        $soundSize = Get-DirectorySize -directoryPath $soundPath
        $dirSizes += "Sounds = ${soundSize}MB"
    } else {
        $dirSizes += "Sounds = Not Found!"
    }

    # Displaying the directory sizes in the specified order
    $dirSizesString = $dirSizes -join ', '
    Write-Host $dirSizesString

    # Display newest assets
    Write-Host "`nNewest Texture Assets:"
    Display-SingleFile -file $global:latestTexture

    Write-Host "`nNewest Object Assets:"
    Display-SingleFile -file $global:latestObject

    Write-Host "`nNewest Sound Assets:"
    Display-SingleFile -file $global:latestSound

    Write-Host "`nNewest Other Assets:"
    Display-SingleFile -file $global:latestOther

    Write-Host ""
    Show-Divider
    Write-Host "Refresh In 15 Seconds, Press M To Return To Menu..."
}



# Function Set Datacachelocation
function Set-DataCacheLocation {
    Write-Host -NoNewline "Enter new Data Cache Location: "
    $newLocation = Read-Host
    $settings = Load-Settings
    Save-Settings -dataCacheLocation $newLocation -soundCacheLocation $settings.SoundCacheLocation
    $global:settings = Load-Settings # Reload settings
    Write-Host "Data Cache Location updated."
}

# Function Set Soundcachelocation
function Set-SoundCacheLocation {
    Write-Host -NoNewline "Enter new Sound Cache Location: "
    $newLocation = Read-Host
    $settings = Load-Settings
    Save-Settings -dataCacheLocation $settings.DataCacheLocation -soundCacheLocation $newLocation
    $global:settings = Load-Settings # Reload settings
    Write-Host "Sound Cache Location updated."
}


# Function Display Singlefile
function Display-SingleFile {
    param ([System.IO.FileInfo]$file)
    if ($file) {
        $size = "{0:N2}KB" -f ($file.Length / 1KB)
        "$($file.Name) = $size"
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
    return "{0:N2}" -f $totalSize  # Removed "MB" from here
}



