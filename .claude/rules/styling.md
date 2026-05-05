---
paths:
  - "src/**/*.tsx"
  - "src/index.css"
---

# Styling

- Utility-first: Tailwind classes in `className` prop
- Always use `cn()` from `@/lib/utils` for class merging
- Prefer `size-*` over separate `w-*`/`h-*` for equal dimensions
- Use CSS variables from `src/index.css` for theme colors (e.g. `bg-primary`, `text-foreground`)
- Tailwind v4 config is CSS-first via `@theme` in `src/index.css` — do not create `tailwind.config.js`
- Style shadcn components via `className` and variant/size props
- Mobile-first responsive approach (`md:`, `lg:` modifiers)
