# Claude Code Setup

Master-Template für alle Nico's Freelance-Projekte.

## Was ist das hier?

- **`.claude/settings.json`** – Claude Code Konfiguration (Permissions, Bash Regeln, etc.)
- **`CLAUDE.md`** – Deine persönlichen Regeln + Best-Practices (wird von Claude gelesen)
- **`README.md`** – Das hier

## Wie nutzen?

### Option 1: Kopieren (einfach)

In deinem Projekt:
```bash
cp -r /pfad/zu/claude-code-setup/.claude .
cp /pfad/zu/claude-code-setup/CLAUDE.md .
```

Dann committed:
```bash
git add .claude CLAUDE.md
git commit -m "Add Claude Code setup"
```

### Option 2: Git Submodule (fortgeschritten)

```bash
git submodule add https://github.com/Solvaray/claude-code-setup.git .claude-setup
```

Dann in deinem `.claude/` symlinken oder Files kopieren.

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
