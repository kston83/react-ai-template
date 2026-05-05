# CLAUDE.md

See AGENTS.md for project instructions, commands, and conventions.

## Claude Code-specific

- Hooks in `.claude/settings.json` enforce lint-on-edit and protect sensitive files — do not disable them
- Path-scoped rules in `.claude/rules/` load automatically near matching files
- Run `npm run lint` then `npm run build` to verify changes (build includes typecheck)
- Do not edit `package-lock.json`, `dist/`, or `.claude/hooks/` directly
