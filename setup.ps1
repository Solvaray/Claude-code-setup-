# Claude Code Setup Script
# Kopiert .claude und CLAUDE.md in alle deine Projekte

Write-Host "Claude Code Setup - Automatische Installation" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green
Write-Host ""

# Pfad zum claude-code-setup Repo
$setupDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Fragen welche Projekte updaten
Write-Host "Gib die Pfade zu deinen Projekten ein (eine pro Zeile, leer = fertig):" -ForegroundColor Yellow
Write-Host "Beispiel: C:\Users\nico\tagebuch" -ForegroundColor Gray
Write-Host ""

$projects = @()
do {
    $path = Read-Host "Projekt-Pfad"
    if ($path -ne "") {
        if (Test-Path $path) {
            $projects += $path
            Write-Host "✓ Hinzugefügt: $path" -ForegroundColor Green
        } else {
            Write-Host "✗ Pfad nicht gefunden: $path" -ForegroundColor Red
        }
    }
} until ($path -eq "")

if ($projects.Count -eq 0) {
    Write-Host "Keine Projekte gewählt. Abbruch." -ForegroundColor Red
    exit
}

Write-Host ""
Write-Host "Kopiere zu $($projects.Count) Projekt(en)..." -ForegroundColor Cyan
Write-Host ""

# Kopiere zu jedem Projekt
foreach ($project in $projects) {
    Write-Host "→ $project" -ForegroundColor Cyan

    # Copy .claude folder
    if (Test-Path "$project\.claude") {
        Write-Host "  .claude existiert bereits, überschreibe..." -ForegroundColor Yellow
        Remove-Item "$project\.claude" -Recurse -Force
    }
    Copy-Item "$setupDir\.claude" -Destination "$project\.claude" -Recurse

    # Copy CLAUDE.md
    if (Test-Path "$project\CLAUDE.md") {
        Write-Host "  CLAUDE.md existiert bereits, überschreibe..." -ForegroundColor Yellow
    }
    Copy-Item "$setupDir\CLAUDE.md" -Destination "$project\CLAUDE.md"

    # Git commit (optional)
    $gitCommit = Read-Host "  Git commit? (j/n)"
    if ($gitCommit -eq "j" -or $gitCommit -eq "ja") {
        Push-Location $project
        git add .claude, CLAUDE.md
        git commit -m "Add Claude Code setup"
        Pop-Location
        Write-Host "  ✓ Committed!" -ForegroundColor Green
    }

    Write-Host ""
}

Write-Host "✓ Fertig!" -ForegroundColor Green
Write-Host "Deine Projekte sind jetzt Claude Code ready!" -ForegroundColor Green
