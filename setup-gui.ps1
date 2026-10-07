Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Claude Code Setup"
$form.Width = 500
$form.Height = 400
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::White

# Title
$label = New-Object System.Windows.Forms.Label
$label.Text = "Claude Code Setup - Wähle deine Projekte"
$label.Location = New-Object System.Drawing.Point(20, 20)
$label.Size = New-Object System.Drawing.Size(450, 30)
$label.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($label)

# Textbox
$textbox = New-Object System.Windows.Forms.TextBox
$textbox.Multiline = $true
$textbox.Location = New-Object System.Drawing.Point(20, 60)
$textbox.Size = New-Object System.Drawing.Size(450, 250)
$textbox.Text = "C:\path\to\projekt1`nC:\path\to\projekt2`nC:\path\to\projekt3`n`n(eine pro Zeile)"
$textbox.Font = New-Object System.Drawing.Font("Courier New", 10)
$form.Controls.Add($textbox)

# Button
$button = New-Object System.Windows.Forms.Button
$button.Text = "Installieren"
$button.Location = New-Object System.Drawing.Point(200, 330)
$button.Size = New-Object System.Drawing.Size(100, 40)
$button.BackColor = [System.Drawing.Color]::LimeGreen
$button.ForeColor = [System.Drawing.Color]::White
$button.Font = New-Object System.Drawing.Font("Arial", 11, [System.Drawing.FontStyle]::Bold)
$button.Add_Click({
    $setupDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $projects = $textbox.Text -split "`n" | Where-Object { $_ -match "^\w:" }

    if ($projects.Count -eq 0) {
        [System.Windows.Forms.MessageBox]::Show("Keine gültigen Projekte gefunden!", "Fehler")
        return
    }

    foreach ($project in $projects) {
        $project = $project.Trim()
        if (Test-Path $project) {
            if (Test-Path "$project\.claude") { Remove-Item "$project\.claude" -Recurse -Force }
            Copy-Item "$setupDir\.claude" -Destination "$project\.claude" -Recurse
            Copy-Item "$setupDir\CLAUDE.md" -Destination "$project\CLAUDE.md"

            Push-Location $project
            git add .claude, CLAUDE.md 2>$null
            git commit -m "Add Claude Code setup" 2>$null
            Pop-Location
        }
    }

    [System.Windows.Forms.MessageBox]::Show("✓ Fertig! $($projects.Count) Projekt(e) updated.", "Erfolg")
    $form.Close()
})
$form.Controls.Add($button)

$form.ShowDialog()
