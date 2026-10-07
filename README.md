# Claude Code Setup

Master-Template für alle Nico's Freelance-Projekte.

## Was ist das hier?

- **`.claude/settings.json`** – Claude Code Konfiguration (Permissions, Bash Regeln, etc.)
- **`CLAUDE.md`** – Deine persönlichen Regeln + Best-Practices (wird von Claude gelesen)
- **`README.md`** – Das hier

## Wie nutzen?

### Option 1: PowerShell Copy-Paste (Windows)

Für jedes Projekt einzeln:

```powershell
# 1. Zu deinem Projekt gehen
cd C:\path\to\mein-projekt

# 2. .claude Ordner + CLAUDE.md kopieren
cp -r C:\path\to\Claude-code-setup-\.claude .
cp C:\path\to\Claude-code-setup-\CLAUDE.md .

# 3. Commit
git add .claude, CLAUDE.md
git commit -m "Add Claude Code setup"
```

### Option 2: Automatisches Setup-Script (Windows)

Nutze `setup.ps1` um alle Projekte auf einmal zu updaten:

```powershell
# Script runterladen und ausführen
.\setup.ps1
```

Das Script fragt dich nach deinen Projekt-Pfaden und macht den Rest automatisch.

### Option 3: Git Submodule (fortgeschritten)

```bash
git submodule add https://github.com/Solvaray/Claude-code-setup.git .claude-setup
```

## Das sollte jedes Projekt haben

```
my-project/
  ├── .claude/
  │   └── settings.json
  ├── CLAUDE.md
  ├── .git/
  ├── .gitignore
  └── ... dein Code
```

## Später: Skills hinzufügen

Wenn du merks, dass du oft das gleiche machst:

```
my-project/.claude/skills/deploy/SKILL.md
my-project/.claude/skills/test/SKILL.md
```

Die Skills kommen dann in Claude Code als `/deploy`, `/test` Kommandos.

Beispiel: `/deploy` pusht zu Vercel, `/test` lässt Tests laufen.

## Refs

- [Claude Code Docs](https://code.claude.com/docs)
- [Boris Cherny Tips](https://x.com/bcherny)
- [Best Practice Repo](https://github.com/shanraisshan/claude-code-best-practice)
