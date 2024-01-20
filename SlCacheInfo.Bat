@echo off
mode 70,24
color 80
title ReportNewAssets
echo.
echo Batch Launcher Started....
echo.
echo.
timeout /t 1 /nobreak >nul

:: Initialization
echo Initialization Started...
echo Relocating To Script..
cd /d "%~dp0"
echo ..In Script Dir
echo Cleaning-Up Folder..
echo Cleaning up..
if exist ".\Errors-Crash.Log" (
    echo ...Deleting Log...
    del /f /q ".\Error-Crash.Log"
)
echo ..Cleaning Done.
echo ...Initialization Completed.
echo.
timeout /t 1 /nobreak >nul

:: Launch Script
echo Starting Launch Sequence...
timeout /t 1 /nobreak >nul
echo Checking PowerShell..
echo ..Capabilities Detected.
if %ERRORLEVEL% equ 0 (
	echo Launching Psc Script..
    timeout /t 1 /nobreak >nul
    pwsh.exe -NoProfile -ExecutionPolicy Bypass -File ".\main.ps1"
    echo ..Psc Process Exited.
) else (
    echo Launching Ps Script..
    timeout /t 1 /nobreak >nul
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\main.ps1"
    echo.
	echo ..Ps Process Exited.
)
echo ...Launch Sequence Complete.
timeout /t 1 /nobreak >nul
echo.

:: Exit
echo.
echo ....Batch Launcher Finished.
echo.
pause
