$setupDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcutPath = "$desktop\Claude Code Setup.lnk"

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = "$setupDir\setup.bat"
$shortcut.WorkingDirectory = $setupDir
$shortcut.IconLocation = "$setupDir\setup.bat,0"
$shortcut.Save()

Write-Host "✓ Shortcut auf Desktop erstellt!" -ForegroundColor Green
[System.Windows.Forms.MessageBox]::Show("Shortcut 'Claude Code Setup' wurde auf deinen Desktop erstellt!`n`nEinfach doppelklick und los geht's!", "Erfolg", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
