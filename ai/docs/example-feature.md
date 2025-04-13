# Feature: [Example Feature]

## Overview
This document provides implementation details for the [Example Feature]. It serves as a reference for both developers and AI assistants when working with this feature.

## Related Documentation
- **User Stories**: See `ai/prd.md` under "Feature A" section
- **Plan**: See `ai/plan.md` under "Phase 2" section

## Implementation Details

### Data Model
The feature uses the following data models:

```typescript
interface ExampleItem {
  id: string;
  title: string;
  description: string;
  status: 'active' | 'archived' | 'pending';
  createdAt: string;
  updatedAt: string;
}

interface ExampleItemFilter {
  status?: 'active' | 'archived' | 'pending';
  searchTerm?: string;
  sort?: 'newest' | 'oldest' | 'alphabetical';
}
```

### API Integration
The feature interacts with the following API endpoints:

- `GET /api/example-items` - List all items (with filtering)
- `GET /api/example-items/:id` - Get a single item
- `POST /api/example-items` - Create a new item
- `PUT /api/example-items/:id` - Update an item
- `DELETE /api/example-items/:id` - Delete an item

These endpoints are implemented in the following hooks:

- `useExampleItems`: For fetching and filtering the list of items
- `useExampleItem`: For fetching a single item
- `useCreateExampleItem`: For creating items
- `useUpdateExampleItem`: For updating items
- `useDeleteExampleItem`: For deleting items

### Components
The feature includes the following components:

1. **ExampleItemList**: Main list view for displaying items
   - Handles filtering, sorting, and pagination
   - Displays items in a card or table format
   - Provides actions for managing items

2. **ExampleItemDetail**: Detailed view of a single item
   - Displays all item properties
   - Provides actions for editing or deleting
   - Shows related information

3. **ExampleItemForm**: Form for creating or editing items
   - Validates input using Zod schema
   - Handles form submission and error states
   - Provides feedback on successful submission

4. **ExampleItemFilters**: Filter controls for the list view
   - Manages filter state
   - Provides UI for selecting filters
   - Persists filter preferences

### State Management
This feature uses the following approaches for state management:

1. **React Query** for server state:
   - Cached data with appropriate staleTime
   - Optimistic updates for mutations
   - Automatic refetching on window focus

2. **Local Component State** for UI state:
   - Form values and validation
   - UI toggles and selections
   - Local pagination state

3. **URL Parameters** for shareable state:
   - Filter selections
   - Sorting preferences
   - Current page

### User Flows

#### Creating a New Item
1. User navigates to the list view
2. User clicks "Create New Item" button
3. Form modal opens with empty fields
4. User fills out the form and submits
5. On success, the modal closes and the list updates
6. On error, the form shows validation or server errors

#### Editing an Item
1. User selects an item from the list
2. User clicks "Edit" on the item card or detail view
3. Form modal opens with pre-filled data
4. User makes changes and submits
5. On success, the modal closes and the item updates
6. On error, the form shows validation or server errors

#### Deleting an Item
1. User selects an item
2. User clicks "Delete"
3. Confirmation dialog appears
4. If confirmed, item is deleted
5. List updates to remove the item
6. Feedback message confirms successful deletion

### Challenges and Solutions

**Challenge**: Maintaining filter state across navigation
**Solution**: Persist filter state in URL parameters using React Router's search params

**Challenge**: Optimistic updates for better UX
**Solution**: Use React Query's optimistic update feature with proper error handling and rollback

**Challenge**: Form validation with complex rules
**Solution**: Implemented Zod schema with conditional validation based on item state

### Performance Considerations
- List view implements virtualization for large data sets
- Debounced search input to prevent excessive API calls
- Pagination implemented for efficient data fetching
- Memoization used for expensive calculations

### Accessibility Features
- All interactive elements have proper ARIA labels
- Form inputs include error messages with aria-describedby
- Focus management implemented for modals and dialogs
- Keyboard navigation supported for all interactions

### Future Improvements
- Add batch operations for multiple items
- Implement drag-and-drop for reordering
- Add advanced filtering options
- Integrate with notification system
- Add export functionality

## Usage Example

```tsx
import { ExampleItemList } from '@/features/example-feature/components/example-item-list';
import { useExampleItems } from '@/features/example-feature/hooks/use-example-items';

function ExampleFeaturePage() {
  const { data, isLoading, error } = useExampleItems();
  
  if (isLoading) return <div>Loading...</div>;
  if (error) return <div>Error: {error.message}</div>;
  
  return (
    <div>
      <h1>Example Feature</h1>
      <ExampleItemList items={data} />
    </div>
  );
}
```