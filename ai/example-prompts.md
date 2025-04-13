# Example AI Prompts

This document contains example prompts to use with AI coding assistants like Cursor AI, GitHub Copilot, or Claude when working with this template. These prompts are structured to help the AI understand the project architecture and generate consistent, high-quality code.

## Feature Creation

### Create a New Feature

```
Following the project structure in `.cursor/rules/`, create a new feature called "todoList" that allows users to add, remove, and mark todos as complete. The feature should include:
1. A TodoList component that displays all todos
2. A TodoItem component for individual todos
3. A form for adding new todos
4. A custom hook for managing todo state
5. Types for the todo data model
```

### Extend an Existing Feature

```
Based on the counter feature in `src/features/counter`, add the ability to set a custom step size for incrementing and decrementing. Update the components, hooks, and tests accordingly.
```

## Component Creation

### Creating a Shared Component

```
Create a Modal component following the patterns in `.cursor/rules/3-patterns.mdc` that:
1. Can be opened and closed
2. Supports different sizes (sm, md, lg)
3. Has a header, body, and footer section
4. Can be closed by clicking outside or pressing Escape
5. Has proper accessibility attributes
Include tests following the testing patterns in `.cursor/rules/4-testing.mdc`.
```

### Creating a Feature-Specific Component

```
Create a TodoFilter component for the todoList feature that allows filtering todos by status (all, active, completed). Follow the project structure defined in `.cursor/rules/2-structure.mdc` and place it in the appropriate feature directory.
```

## Hook Creation

```
Create a custom hook called useLocalStorage that:
1. Works like useState but persists the value in localStorage
2. Takes a key and initial value as parameters
3. Updates localStorage when the value changes
4. Retrieves the stored value on initial render
5. Has proper TypeScript typing
Include tests following the patterns in `.cursor/rules/4-testing.mdc`.
```

## Testing

```
Create comprehensive tests for the Button component in `src/components/ui/Button.tsx` following the testing patterns in `.cursor/rules/4-testing.mdc`. Include tests for rendering, user interactions, and different prop combinations.
```

## Documentation Creation

```
Create documentation for the todoList feature in the AI docs directory following the example in `ai/docs/counter-feature.md`. Include an overview, implementation details, usage examples, and extension points.
```

## Context Creation

```
Create a ThemeContext that:
1. Provides theme state (light/dark) to the application
2. Includes a toggle function to switch themes
3. Persists the theme preference in localStorage
4. Follows the patterns in `.cursor/rules/3-patterns.mdc`
Include a ThemeProvider component and a useTheme hook for consuming the context.
```

## Form Handling

```
Create a form component for user registration using React Hook Form and Zod validation. Follow the form handling patterns in `.cursor/rules/3-patterns.mdc` and implement:
1. Email, password, and confirm password fields
2. Validation for all fields
3. Error messages for validation errors
4. Form submission handling
Include tests for form validation and submission.
```

## API Integration

```
Create a data fetching hook called useUsers that:
1. Fetches a list of users from an API
2. Uses React Query for data fetching and caching
3. Handles loading and error states
4. Follows the patterns in `.cursor/rules/3-patterns.mdc`
Include types for the API response and error handling.
```

## Type Definition

```
Create TypeScript types for a blog feature that will include posts, comments, and users. Follow the typing patterns used in the project and consider relationships between entities.
```

## CSS/Styling

```
Style the CounterPage component in `src/features/counter/components/CounterPage.tsx` using Tailwind CSS. Make it responsive and visually appealing while following the project's styling conventions.
```

## State Management

```
Implement a Zustand store for managing global application state, following the state management approach outlined in `.cursor/rules/1-overview.mdc`. Include actions for user authentication (login, logout, update profile).