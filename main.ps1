# PowerShell Script for Monitoring Second Life Cache

# Set These Values ONLY
$dataDir = "R:\FireStorm\Data"
$soundDir = "R:\FireStorm\Sound"

# Variables
$objectDir = "$dataDir\objectcache"
$textureDir = "$dataDir\texturecache"
$otherAssetsDir = "$dataDir\cache"

# Variables to store the names of the most recent files
$latestTexture = $null
$latestObject = $null
$latestSound = $null
$latestOther = $null

# Initialization
[Console]::ForegroundColor = [ConsoleColor]::White
[Console]::BackgroundColor = [ConsoleColor]::DarkGray
[Console]::Clear() 
Write-Host "`n ReportNewAssets Started....`n`n"
Start-Sleep -Seconds 1

# Function to update the latest file name in a category
function Update-LatestFileName {
    param (
        [string]$directory,
        [string]$extension,
        [ref]$latestFileName
    )

    $latestFile = Get-ChildItem -Path $directory -Filter "*$extension" -Recurse | 
                  Sort-Object LastWriteTime -Descending | 
                  Select-Object -First 1

    if ($latestFile) {
        if (-not $latestFileName.Value -or $latestFile.LastWriteTime -gt $latestFileName.Value.LastWriteTime) {
            $latestFileName.Value = $latestFile
        }
    }
}

# Function to display a single file
function Display-SingleFile {
    param ([System.IO.FileInfo]$file)

    if ($file) {
        $size = "{0:N2} KB" -f ($file.Length / 1KB)
        "$($file.Name) - $size"
    }
}

# Function to setup and start FileSystemWatcher
function Start-FileSystemWatcher {
    param (
        [string]$path,
        [string]$filter,
        [ref]$latestFileName
    )

    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = $path
    $watcher.Filter = $filter
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true

    Register-ObjectEvent -InputObject $watcher -EventName Created -Action {
        Write-Host "New file detected: $($Event.SourceEventArgs.FullPath)"
        Update-LatestFileName -directory $path -extension $filter -latestFileName $latestFileName
        Display-AssetReport
    }
}

# Function to display asset report
function Display-AssetReport {
    [Console]::ForegroundColor = [ConsoleColor]::White
    [Console]::BackgroundColor = [ConsoleColor]::DarkGray
    [Console]::Clear() 

    Write-Host "`n                      -= Report New Assets =-"
    Write-Host "`n Cache/Sound:"
	Write-Host "$dataDir`n$soundDir`n"
    
    Write-Host " Textures:"
    Display-SingleFile -file $global:latestTexture

    Write-Host "`n Objects:"
    Display-SingleFile -file $global:latestObject

    Write-Host "`n Sounds:"
    Display-SingleFile -file $global:latestSound

    Write-Host "`n Other:"
    Display-SingleFile -file $global:latestOther
	
	Write-Host "`n Refresh In 15 Seconds..."
}

# Update latest file names initially
function Initialize-LatestFileNames {
    Update-LatestFileName -directory $textureDir -extension ".texture" -latestFileName ([ref]$global:latestTexture)
    Update-LatestFileName -directory $objectDir -extension ".slc" -latestFileName ([ref]$global:latestObject)
    Update-LatestFileName -directory $soundDir -extension ".dsf" -latestFileName ([ref]$global:latestSound)
    Update-LatestFileName -directory $otherAssetsDir -extension ".asset" -latestFileName ([ref]$global:latestOther)
}


# Start monitoring directories
function Start-DirectoryMonitoring {
    Start-FileSystemWatcher -path $textureDir -filter "*.texture" -category "Textures"
    Start-FileSystemWatcher -path $objectDir -filter "*.slc" -category "Objects"
    Start-FileSystemWatcher -path $soundDir -filter "*.dsf" -category "Sounds"
    Start-FileSystemWatcher -path $otherAssetsDir -filter "*.asset" -category "Other"
}


# Entry Point
Initialize-LatestFileNames
Start-DirectoryMonitoring
Display-AssetReport
while ($true) {    
    Start-Sleep -Seconds 15
}
