# Claude Code Setup für Nico

Freestyle Web Developer. HTML/CSS/JS + Vercel + GitHub.

## Prinzipien

- **Plan-Mode first**: Komplexe Tasks IMMER mit `/plan` starten. Plan mitdenken, nicht direkt coden.
- **Git Worktrees**: Für parallele Arbeit. Nie auf `main` direkt arbeiten.
- **Git Commits**: Aussagekräftig, kurz: "add deployment button" nicht "update".
- **Vercel**: Einfach `git push` → deployed. Keine manuelle Steps.

## Workflow Everytime

1. **Plan** (`/plan`) – Was, warum, wie? 5 Min denken = 30 Min sparen coden.
2. **Branch** – `git worktree add -b feature/xyz` (nicht auf main)
3. **Code** – Klein, testbar, commit oft.
4. **Test** – Lokal laufen lassen, Vercel Preview checken.
5. **Commit** – Nachricht aussagekräftig.
6. **PR/Merge** – Code Review (selber grillen oder andere), dann merge.

## Claude-Tipps (vom Boris Team)

- **Challenge Claude**: "Grill mich drauf, ich pass deine Test nicht auf bis ich alles verstehe."
- **Fix-Bugs direkt**: Paste Error → "fix." Nicht erklären wie.
- **Iterieren wenn's schlecht ist**: "Knowing everything now, scrap und elegant lösen."
- **Specs sind König**: Detailliert schreiben = besser Output.

## Regeln für Claude

- Immer `.claude/` Struktur respektieren (settings.json + CLAUDE.md).
- Vercel-Secrets nicht in Code → Environment Variables.
- Immer `git status` vor Commit checken.
- Hooks sind async – kann langsam sein, ignorier wenn's hängt.

## Zu lernen (später)

- Skills (wenn 2x das gleiche machen)
- Agents (wenn Workflows wiederholen)
- Hooks (wenn Pre/Post-Actions brauchst)

---

**Last Updated**: Oct 7, 2026
