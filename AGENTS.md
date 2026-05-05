# AGENTS.md

## Commands

```bash
npm run dev       # Vite dev server → localhost:5173
npm run build     # tsc -b && vite build (typecheck + build)
npm run lint      # ESLint 9 flat config
npm run preview   # Preview production build
```

No test runner is configured yet. Do not run `npm test`.

## Verification (run in order)

```bash
npm run lint
npm run build
```

Build includes typecheck. Both must pass before any commit.

## Architecture

- **Entry**: `src/main.tsx` → `ThemeProvider` → `App.tsx` → `HomePage`
- **Features**: `src/features/{name}/` with `components/`, `hooks/`, `utils/`, `types.ts`
- **Shared**: `src/components/ui/` (shadcn), `src/lib/utils.ts` (`cn`), `src/hooks/`, `src/context/`, `src/types/`
- **Path alias**: `@/` → `./src/`

## Stack

React 19, TypeScript 5.7 (strict), Vite 6, Tailwind CSS v4 (`@tailwindcss/vite`), shadcn/ui (new-york), ESLint 9 flat config.

**Not installed** — do not assume: React Router, React Query, Zustand, React Hook Form, Vitest.

## Constraints

- Never `import React from 'react'` — named imports only
- `cn()` from `@/lib/utils` for all class merging
- Tailwind `size-*` over separate `w-*`/`h-*` for equal dimensions
- Tailwind config is CSS-first in `src/index.css` via `@theme` — no `tailwind.config.js`
- Add shadcn components via `npx shadcn@latest add <component>`
- Relative imports within a feature; `@/` imports for shared code
- `noUnusedLocals` + `noUnusedParameters` — dead code fails typecheck
- Conventional Commits for all commit messages

## Enforcement

- **Commit-time**: husky + lint-staged runs `eslint --fix` on staged `.ts`/`.tsx` files
- **Claude Code**: `.claude/settings.json` hooks enforce lint-on-edit, protect sensitive files, and block dangerous commands
- **CI**: lint + build must pass

## References

- `ai/prd.md` — product requirements
- `ai/plan.md` — implementation plan
- `ai/docs/{feature}.md` — feature documentation (see `ai/docs/example-feature.md`)
- `.claude/rules/` — path-scoped rules (loaded only near matching files)
