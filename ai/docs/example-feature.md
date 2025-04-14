# Feature: [Example Feature]

## Overview
This document provides implementation details for the [Example Feature], built using React 19, Tailwind v4, and Shadcn UI components. It serves as a reference for both developers and AI assistants.

## Related Documentation
- **User Stories**: See @file(react-template-ai/ai/prd.md) under "[Feature Name]" section
- **Plan**: See @file(react-template-ai/ai/plan.md) under "Phase X" section

## Implementation Details

### Data Model
The feature uses the following TypeScript data models (defined in `src/features/example-feature/types.ts`):

```typescript
// Example - Replace with actual types
interface ExampleItem {
  id: string;
  title: string;
  description: string;
  status: 'active' | 'archived' | 'pending';
  createdAt: string; // Consider Date object if appropriate
  updatedAt: string; // Consider Date object if appropriate
}

interface ExampleItemFilter {
  status?: 'active' | 'archived' | 'pending';
  searchTerm?: string;
  sort?: 'newest' | 'oldest' | 'alphabetical';
}
```

### API Integration & Hooks
The feature interacts with API endpoints via custom hooks (located in `src/features/example-feature/hooks/`).

**Data Fetching:**
- `useExampleItems(filters)`: Fetches list data (e.g., from GET `/api/example-items`). May use React 19 `use` hook internally for Suspense integration.
- `useExampleItem(id)`: Fetches single item details (e.g., from GET `/api/example-items/:id`). May use React 19 `use` hook.

**Mutations:** (Consider React 19 Actions or React Query mutations)
- `useCreateExampleItem`: Handles item creation (e.g., POST `/api/example-items`). May be a server action used with `useActionState`.
- `useUpdateExampleItem`: Handles item updates (e.g., PUT `/api/example-items/:id`). May be a server action.
- `useDeleteExampleItem`: Handles item deletion (e.g., DELETE `/api/example-items/:id`). May be a server action.

### Components
The feature includes the following components (located in `src/features/example-feature/components/`), built with Shadcn UI and styled with Tailwind v4:

1. **ExampleItemList**: Main list view.
   - Uses Shadcn Card, Table, Checkbox, Button, etc.
   - Handles filtering/sorting UI.
   - Implements pagination or virtualization if needed.
   - Styles adhere to @file(.cursor/rules/4-styling-patterns.md).

2. **ExampleItemDetail**: Detail view.
   - Displays properties using Shadcn components (Badge, etc.).

3. **ExampleItemForm**: Create/Edit form.
   - Uses Shadcn Input, Select, Textarea, Form (if using RHF integration).
   - Implements validation (e.g., Zod).
   - May integrate with React 19 Actions via `useActionState` and `useFormStatus`.

4. **ExampleItemFilters**: Filter controls.
   - Uses Shadcn Select, Input, Button.

### State Management
- **Server State/Cache**: Managed by React Query (if used) or handled via Workspace + React 19 `use` hook + manual caching/revalidation if needed.
- **Local UI State**: Managed with `useState` within components (e.g., form inputs before submission, UI toggles).
- **Form State**: Managed by React Hook Form (if used) or React 19 `useActionState`.
- **Shared Feature State**: Managed via React Context API (`createContext`, `useContext`) if needed across multiple components within the feature.
- **URL State**: Filter/sort/page state managed via `URLSearchParams` for shareability.

### User Flows
(Update descriptions to reflect specific UI/UX and potential use of Actions/Suspense)
- Creating a New Item
- Editing an Item
- Deleting an Item

### Challenges and Solutions
(Update with relevant challenges encountered and solutions using the current stack)

- **Example:** Challenge: Smooth loading states for complex data. Solution: Integrated React Suspense using the React 19 `use` hook in data fetching hooks.
- **Example:** Challenge: Managing form pending/error states reliably. Solution: Utilized React 19 Actions with `useActionState` and `useFormStatus`.

### Performance Considerations
- List view virtualization (if applicable).
- Debounced inputs for search/filtering.
- Leveraging React 19 Suspense via `use` hook.
- Optimized Tailwind v4 CSS.
- Code splitting via `React.lazy`.

### Accessibility Features
- Semantic HTML structure.
- Leveraging built-in accessibility of Shadcn UI components.
- Ensuring proper focus management for modals/dialogs.
- Keyboard navigation support tested.
- Sufficient color contrast (using theme variables).

### Future Improvements
[Potential enhancements]

### Usage Example (Conceptual)
```typescript
import { Suspense } from 'react'; // Import Suspense
import { ExampleItemList } from '@/features/example-feature/components/ExampleItemList';
import { ExampleItemFilters } from '@/features/example-feature/components/ExampleItemFilters';
import { useExampleItems } from '@/features/example-feature/hooks/useExampleItems'; // Assume this uses 'use' hook

function ExampleFeaturePage() {
  // State for filters
  const [filters, setFilters] = useState<ExampleItemFilter>({});

  // Data fetching hook that uses 'use' hook internally will suspend
  const items = useExampleItems(filters);

  return (
    <div>
      <h1>Example Feature</h1>
      <ExampleItemFilters currentFilters={filters} onFilterChange={setFilters} />
      {/* Wrap data-dependent component in Suspense */}
      <Suspense fallback={<div>Loading items...</div>}>
        <ExampleItemList items={items} />
      </Suspense>
    </div>
  );
}

// NOTE: This example assumes useExampleItems uses the React 19 'use' hook
// and the component structure supports Suspense at this level.
// Adjust based on actual implementation.
```