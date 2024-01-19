# Script: artwork.ps1

# Function Show Title
function Show-Title {
    Write-Host "`n===========================( SlCacheInfo )============================`n"
}

# Function Show Divider
function Show-Divider {
	Write-Host "----------------------------------------------------------------------"
}

# Function Show Asciiart
function Show-AsciiArt {
    $asciiArt = @"
        ____  _  ____           _          ___        __       
       / ___|| |/ ___|____  ___| |__   ___|_ _|____  / _| ___  
       \___ \| | |   / _  |/ __|  _ \ / _ \| ||  _ \| |_ / _ \ 
        ___) | | |__| (_| | (__| | | |  __/| || | | |  _| (_) |
       |____/|_|\____\__,_|\___|_| |_|\___|___|_| |_|_|  \___/ 
"@
    Write-Host $asciiArt
}
