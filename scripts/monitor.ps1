# Script: monitor.ps1

function Start-MonitoringAssets {
    Initialize-LatestFileNames
    Start-DirectoryMonitoring
    while ($true) {
        Display-AssetReport
        Start-Sleep -Seconds 15
    }
}

# Function Update Latestfilename
function Update-LatestFileName {
    param (
        [string]$directory,
        [string]$extension,
        [string]$latestFileName
    )
    $latestFile = Get-ChildItem -Path $directory -Filter "*$extension" -Recurse | 
                  Sort-Object LastWriteTime -Descending | 
                  Select-Object -First 1

    if ($latestFile) {
        $currentLatestFile = Get-Variable -Name $latestFileName -ValueOnly -Scope Global
        if (-not $currentLatestFile -or $latestFile.LastWriteTime -gt $currentLatestFile.LastWriteTime) {
            Set-Variable -Name $latestFileName -Value $latestFile -Scope Global
        }
    }
}

# Function Start Filesystemwatcher
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
        Update-LatestFileName -directory $path -extension $filter -latestFileName $latestFileName
        Display-AssetReport
    }
}

# Function Initialize Latestfilenames
function Initialize-LatestFileNames {
    Update-LatestFileName -directory $textureDir -extension ".texture" -latestFileName "latestTexture"
    Update-LatestFileName -directory $objectDir -extension ".slc" -latestFileName "latestObject"
    Update-LatestFileName -directory $soundDir -extension ".dsf" -latestFileName "latestSound"
    Update-LatestFileName -directory $otherAssetsDir -extension ".asset" -latestFileName "latestOther"
}

# Function Start Directorymonitoring
function Start-DirectoryMonitoring {
    Start-FileSystemWatcher -path $textureDir -filter "*.texture" -category "Textures"
    Start-FileSystemWatcher -path $objectDir -filter "*.slc" -category "Objects"
    Start-FileSystemWatcher -path $soundDir -filter "*.dsf" -category "Sounds"
    Start-FileSystemWatcher -path $otherAssetsDir -filter "*.asset" -category "Other"
}