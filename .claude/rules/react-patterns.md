---
paths:
  - "src/**/*.tsx"
  - "src/**/*.ts"
---

# React Patterns

- Function components only — no class components
- Never `import React from 'react'` — use named imports: `useState`, `useEffect`, `use`
- Use the `use` hook for reading promises (Suspense integration) and context
- Define props with TypeScript interfaces, never `any`
- Extract reusable logic into hooks at `src/hooks/` or `src/features/{name}/hooks/`
- Do not use `React.forwardRef` — pass ref as a normal prop (React 19)
