@echo off
cd /d "%~dp0"
powershell -ExecutionPolicy Bypass -File setup-gui.ps1
pause
