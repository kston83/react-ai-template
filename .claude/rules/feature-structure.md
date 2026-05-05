---
paths:
  - "src/features/**"
---

# Feature Organization

- Each feature lives at `src/features/{featureName}/`
- Standard subdirs: `components/`, `hooks/`, `utils/`, `types.ts`
- Use relative imports within a feature module
- Use `@/` absolute imports for anything shared across features
- Export public API from `index.ts` if the feature is consumed externally
- Document features in `ai/docs/{featureName}.md`
