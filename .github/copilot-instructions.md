# Copilot Instructions

See [AGENTS.md](../AGENTS.md) for full project instructions.

This project uses React 19, TypeScript 5.7 (strict), Vite 6, Tailwind CSS v4, and shadcn/ui.

Key rules:
- Never `import React from 'react'` — named imports only
- `cn()` from `@/lib/utils` for class merging
- Tailwind `size-*` over `w-*`/`h-*` for equal dimensions
- No `tailwind.config.js` — config is CSS-first in `src/index.css`
- Features go in `src/features/{name}/`
- Run `npm run lint` then `npm run build` to verify
