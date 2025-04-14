# Example AI Prompts for React 19 / Tailwind v4 Template

This document contains example prompts to use with AI coding assistants like Cursor AI, GitHub Copilot, or Claude when working with this template. These prompts are structured to help the AI understand the project architecture (React 19, Tailwind v4, Shadcn UI) and generate consistent, high-quality code by referencing the `.cursor/rules/` directory.

## Feature Creation

### Create a New Feature

Following the project structure in @file(.cursor/rules/2-structure.md) and React patterns in @file(.cursor/rules/3-react-patterns.md), create a new feature called "todoList" that allows users to add, remove, and mark todos as complete. The feature should include:

- A TodoList component displaying todos using Shadcn UI components (e.g., Card, Checkbox, Button) styled according to @file(.cursor/rules/4-styling-patterns.md)
- A TodoItem component for individual todos
- A form for adding new todos, potentially using React 19 Actions if appropriate for the project patterns
- A custom hook `useTodos` for managing todo state (use useState or a state management library if configured)
- TypeScript types for the todo data model

### Extend an Existing Feature

Based on the existing [feature-name] feature in `src/features/[feature-name]`, add the ability to [new functionality]. Update the components, hooks (using React 19 patterns where applicable), and tests accordingly. Ensure changes align with the guidelines in `.cursor/rules/`.

## Component Creation

### Creating a Shared Shadcn UI Component Wrapper

Create a reusable Modal component wrapper around Shadcn UI's Dialog component, following the patterns in @file(.cursor/rules/3-react-patterns.md) and @file(.cursor/rules/4-styling-patterns.md). It should:

- Accept `isOpen`, `onOpenChange`, `title`, `description`, `children` (for body), and `footerContent` props
- Render the Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription, DialogFooter parts appropriately
- Ensure proper accessibility attributes are handled by the underlying Shadcn component
- Use the `cn` utility from @file(ai-template-gemini/src/lib/utils.ts) for merging class names
- Place this component in `src/components/ui/modal.tsx`
- Include tests following @file(.cursor/rules/5-testing-patterns.md)

### Creating a Feature-Specific Component

Create a `UserProfileCard` component for the `userProfile` feature. It should display user data (avatar, name, email). Use Shadcn UI's Card and Avatar components. Follow the project structure defined in @file(.cursor/rules/2-structure.md) and styling guidelines in @file(.cursor/rules/4-styling-patterns.md). Place it in `src/features/userProfile/components/UserProfileCard.tsx`.

## Hook Creation

### Create a Hook using React 19 `use`

Create a custom hook `useFetchUserProfile` that fetches user profile data from `/api/user/profile`:

- Use the React 19 `use` hook to handle the promise returned by Workspace
- The hook should integrate with React Suspense for loading states
- Handle potential fetch errors gracefully
- Define appropriate TypeScript types for the user profile data
- Follow hook patterns in @file(.cursor/rules/3-react-patterns.md)
- Place this hook in `src/hooks/useFetchUserProfile.ts` or a relevant feature hook directory
- Include tests

### Create a Hook for Local Storage

Create a custom hook called `useLocalStorage` that:

- Works like `useState` but persists the value in `localStorage`
- Takes a key (string) and initial value (generic type T) as parameters
- Returns the current value and an updater function `[T, (value: T | ((prevValue: T) => T)) => void]`
- Updates `localStorage` when the value changes
- Retrieves the stored value on initial render, falling back to the initial value
- Has proper TypeScript typing using generics
- Follows hook patterns in @file(.cursor/rules/3-react-patterns.md)
- Include tests following @file(.cursor/rules/5-testing-patterns.md)

## Testing

Create comprehensive tests for the Shadcn Button component usage in `src/features/[some-feature]/components/SubmitButton.tsx`, following the testing patterns in @file(.cursor/rules/5-testing-patterns.md). Include tests for:

- Rendering
- User interactions (click)
- Disabled state
- Applied variants/styles based on props

## Documentation Creation

Create documentation for the `todoList` feature in the AI docs directory, following the example structure in @file(ai-template-gemini/ai/docs/example-feature.md). Ensure implementation details reflect React 19 patterns and Tailwind v4/Shadcn usage.

## Form Handling (with React 19 Actions Example)

Create a `SettingsForm` component using React 19 Actions:

- Define server action function `updateSettingsAction`
- Use the `useActionState` hook to manage form state (pending, errors, data)
- Use the `useFormStatus` hook to disable the submit button during submission
- Include fields for 'username' and 'email'
- Display errors returned from the action state
- Follow patterns in @file(.cursor/rules/3-react-patterns.md)
- Include tests

## API Integration (using `use` hook example)

Refactor the data fetching logic in the `ProductDetail` component to use a dedicated hook `useProductData(productId)` which leverages the React 19 `use` hook for fetching data from `/api/products/:id`. Ensure the component uses `<Suspense>` for the loading state. Follow patterns in @file(.cursor/rules/3-react-patterns.md).

## Type Definition

Define TypeScript types for an e-commerce Order feature. Include interfaces for:

- `Order`
- `OrderItem`
- `Address`
- `PaymentDetails`

Follow the typing patterns used in the project (`src/features/[feature]/types.ts`). Consider potential relationships and use appropriate primitive types or custom types.

## CSS/Styling

Style the `DashboardLayout` component in `src/layouts/DashboardLayout.tsx` using Tailwind CSS v4:

- Implement a responsive sidebar and main content area
- Use CSS variables defined in @file(ai-template-gemini/src/index.css) for theming where appropriate
- Ensure it adheres to @file(.cursor/rules/4-styling-patterns.md)
- Prefer `size-*` utilities for icons or fixed-size elements