---
name: shadcn
description: Complete shadcn/ui component management for adding, searching, fixing, styling, and composing UI.
license: MIT
metadata:
  source: shadcn/ui
---

# shadcn/ui

A framework for building ui, components and design systems. Components are added as source code to the user's project via the CLI.

> **IMPORTANT:** Run all CLI commands using the project's package runner: `npx shadcn@latest`, `pnpm dlx shadcn@latest`, or `bunx --bun shadcn@latest` — based on the project's `packageManager`. Examples below use `npx shadcn@latest` but substitute the correct runner for the project.

## Current Project Context

```json
!`npx shadcn@latest info --json`
```

The JSON above contains the project config and installed components. Use `npx shadcn@latest docs <component>` to get documentation and example URLs for any component.

## Principles

1. **Use existing components first.** Use `npx shadcn@latest search` to check registries before writing custom UI. Check community registries too.
2. **Compose, don't reinvent.** Settings page = Tabs + Card + form controls. Dashboard = Sidebar + Card + Chart + Table.
3. **Use built-in variants before custom styles.** `variant="outline"`, `size="sm"`, etc.
4. **Use semantic colors.** `bg-primary`, `text-muted-foreground` — never raw values like `bg-blue-500`.

## Critical Rules

These rules are **always enforced**. Each links to a file with Incorrect/Correct code pairs.

### Styling & Tailwind → [styling.md](./rules/styling.md)

- **`className` for layout, not styling.** Never override component colors or typography.
- **No `space-x-*` or `space-y-*`.** Use `flex` with `gap-*`. For vertical stacks, `flex flex-col gap-*`.
- **Use `size-*` when width and height are equal.** `size-10` not `w-10 h-10`.
- **Use `truncate` shorthand.** Not `overflow-hidden text-ellipsis whitespace-nowrap`.
- **No manual `dark:` color overrides.** Use semantic tokens (`bg-background`, `text-muted-foreground`).
- **Use `cn()` for conditional classes.** Don't write manual template literal ternaries.
- **No manual `z-index` on overlay components.** Dialog, Sheet, Popover, etc. handle their own stacking.

### Forms & Inputs → [forms.md](./rules/forms.md)

- **Forms use `FieldGroup` + `Field`.** Never use raw `div` with `space-y-*` or `grid gap-*` for form layout.
- **`InputGroup` uses `InputGroupInput`/`InputGroupTextarea`.** Never raw `Input`/`Textarea` inside `InputGroup`.
- **Buttons inside inputs use `InputGroup` + `InputGroupAddon`.**
- **Option sets (2–7 choices) use `ToggleGroup`.** Don't loop `Button` with manual active state.
- **`FieldSet` + `FieldLegend` for grouping related checkboxes/radios.** Don't use a `div` with a heading.
- **Field validation uses `data-invalid` + `aria-invalid`.** `data-invalid` on `Field`, `aria-invalid` on the control. For disabled: `data-disabled` on `Field`, `disabled` on the control.

### Component Structure → [composition.md](./rules/composition.md)

- **Items always inside their Group.** `SelectItem` → `SelectGroup`. `DropdownMenuItem` → `DropdownMenuGroup`. `CommandItem` → `CommandGroup`.
- **Use `asChild` (radix) or `render` (base) for custom triggers.** Check `base` field from `npx shadcn@latest info`.
- **Dialog, Sheet, and Drawer always need a Title.** `DialogTitle`, `SheetTitle`, `DrawerTitle` required for accessibility. Use `className="sr-only"` if visually hidden.
- **Use full Card composition.** `CardHeader`/`CardTitle`/`CardDescription`/`CardContent`/`CardFooter`. Don't dump everything in `CardContent`.
- **Button has no `isPending`/`isLoading`.** Compose with `Spinner` + `data-icon` + `disabled`.
- **`TabsTrigger` must be inside `TabsList`.** Never render triggers directly in `Tabs`.
- **`Avatar` always needs `AvatarFallback`.** For when the image fails to load.

### Use Components, Not Custom Markup → [composition.md](./rules/composition.md)

- **Use existing components before custom markup.** Check if a component exists before writing a styled `div`.
- **Callouts use `Alert`.** Don't build custom styled divs.
- **Empty states use `Empty`.** Don't build custom empty state markup.
- **Toast via `sonner`.** Use `toast()` from `sonner`.
- **Use `Separator`** instead of `<hr>` or `<div className="border-t">`.
- **Use `Skeleton`** for loading placeholders. No custom `animate-pulse` divs.
- **Use `Badge`** instead of custom styled spans.

### Icons → [icons.md](./rules/icons.md)

- **Icons in `Button` use `data-icon`.** `data-icon="inline-start"` or `data-icon="inline-end"` on the icon.
- **No sizing classes on icons inside components.** Components handle icon sizing via CSS. No `size-4` or `w-4 h-4`.
- **Pass icons as objects, not string keys.** `icon={CheckIcon}`, not a string lookup.

### CLI

- **Never decode preset codes or build preset URLs manually.** Use `npx shadcn@latest preset decode <code>`, `preset url <code>`, or `preset open <code>`. For project-aware preset detection, use `npx shadcn@latest preset resolve`.
- **Apply preset codes directly with the CLI.** Use `npx shadcn@latest apply <code>` for existing projects, or `npx shadcn@latest init --preset <code>` when initializing.

## Key Patterns

These are the most common patterns that differentiate correct shadcn/ui code. For edge cases, see the linked rule files above.

```tsx
// Form layout: FieldGroup + Field, not div + Label.
<FieldGroup>
  <Field>
    <FieldLabel htmlFor="email">Email</FieldLabel>
    <Input id="email" />
  </Field>
</FieldGroup>

// Validation: data-invalid on Field, aria-invalid on the control.
<Field data-invalid>
  <FieldLabel>Email</FieldLabel>
  <Input aria-invalid />
  <FieldDescription>Invalid email.</FieldDescription>
</Field>

// Icons in buttons: data-icon, no sizing classes.
<Button>
  <SearchIcon data-icon="inline-start" />
  Search
</Button>

// Spacing: gap-*, not space-y-*.
<div className="flex flex-col gap-4">  // correct
<div className="space-y-4">           // wrong

// Equal dimensions: size-*, not w-* h-*.
<Avatar className="size-10">   // correct
<Avatar className="w-10 h-10"> // wrong

// Status colors: Badge variants or semantic tokens, not raw colors.
<Badge variant="secondary">+20.1%</Badge>    // correct
<span className="text-emerald-600">+20.1%</span> // wrong
```

## Component Selection

| Need | Use |
|------|-----|
| Button/action | `Button` with appropriate variant |
| Form inputs | `Input`, `Select`, `Combobox`, `Switch`, `Checkbox`, `RadioGroup`, `Textarea`, `InputOTP`, `Slider` |
| Toggle between 2–5 options | `ToggleGroup` + `ToggleGroupItem` |
| Data display | `Table`, `Card`, `Badge`, `Avatar` |
| Navigation | `Sidebar`, `NavigationMenu`, `Breadcrumb`, `Tabs`, `Pagination` |
| Overlays | `Dialog` (modal), `Sheet` (side panel), `Drawer` (bottom sheet), `AlertDialog` (confirmation) |
| Feedback | `sonner` (toast), `Alert`, `Progress`, `Skeleton`, `Spinner` |
| Command palette | `Command` inside `Dialog` |
| Charts | `Chart` (wraps Recharts) |
| Layout | `Card`, `Separator`, `Resizable`, `ScrollArea`, `Accordion`, `Collapsible` |
| Empty states | `Empty` |
| Menus | `DropdownMenu`, `ContextMenu`, `Menubar` |
| Tooltips/info | `Tooltip`, `HoverCard`, `Popover` |

## Key Fields

The injected project context contains these key fields:

- **`aliases`** → use the actual alias prefix for imports (e.g. `@/`, `~/`), never hardcode.
- **`isRSC`** → when `true`, components using `useState`, `useEffect`, event handlers, or browser APIs need `"use client"` at the top of the file. Always reference this field when advising on the directive.
- **`tailwindVersion`** → `"v4"` uses `@theme inline` blocks; `"v3"` uses `tailwind.config.js`.
- **`tailwindCssFile`** → the global CSS file where custom CSS variables are defined. Always edit this file, never create a new one.
- **`style`** → component visual treatment (e.g. `nova`, `vega`).
- **`base`** → primitive library (`radix` or `base`). Affects component APIs and available props.
- **`iconLibrary`** → determines icon imports. Use `lucide-react` for `lucide`, `@tabler/icons-react` for `tabler`, etc. Never assume `lucide-react`.
- **`resolvedPaths`** → exact file-system destinations for components, utils, hooks, etc.
- **`framework`** → routing and file conventions (e.g. Next.js App Router vs Vite SPA).
- **`packageManager`** → use this for any non-shadcn dependency installs (e.g. `pnpm add date-fns` vs `npm install date-fns`).
- **`preset`** → resolved preset code and values for the current project. Use `npx shadcn@latest preset resolve --json` when you only need preset information.

## Component Docs, Examples, and Usage

Run `npx shadcn@latest docs <component>` to get the URLs for a component's documentation, examples, and API reference. Fetch these URLs to get the actual content.

```bash
npx shadcn@latest docs button dialog select
```

**When creating, fixing, debugging, or using a component, always run `npx shadcn@latest docs` and fetch the URLs first.** This ensures you're working with the correct API and usage patterns rather than guessing.

## Workflow

1. **Get project context** — already injected above. Run `npx shadcn@latest info` again if you need to refresh.
2. **Check installed components first** — before running `add`, always check the `components` list from project context or list the `resolvedPaths.ui` directory. Don't import components that haven't been added, and don't re-add ones already installed.
3. **Find components** — `npx shadcn@latest search`.
4. **Get docs and examples** — run `npx shadcn@latest docs <component>` to get URLs, then fetch them. Use `npx shadcn@latest view` to browse registry items you haven't installed. To preview changes to installed components, use `npx shadcn@latest add --diff`.
5. **Install or update** — `npx shadcn@latest add`. When updating existing components, use `--dry-run` and `--diff` to preview changes first (see [Updating Components](#updating-components) below).
6. **Fix imports in third-party components** — After adding components from community registries (e.g. `@bundui`, `@magicui`), check the added non-UI files for hardcoded import paths like `@/components/ui/...`. These won't match the project's actual aliases. Use `npx shadcn@latest info` to get the correct `ui` alias (e.g. `@workspace/ui/components`) and rewrite the imports accordingly. The CLI rewrites imports for its own UI files, but third-party registry components may use default paths that don't match the project.
7. **Review added components** — After adding a component or block from any registry, **always read the added files and verify they are correct**. Check for missing sub-components (e.g. `SelectItem` without `SelectGroup`), missing imports, incorrect composition, or violations of the [Critical Rules](#critical-rules). Also replace any icon imports with the project's `iconLibrary` from the project context (e.g. if the registry item uses `lucide-react` but the project uses `hugeicons`, swap the imports and icon names accordingly). Fix all issues before moving on.
8. **Registry must be explicit** — When the user asks to add a block or component, **do not guess the registry**. If no registry is specified (e.g. user says "add a login block" without specifying `@shadcn`, `@tailark`, etc.), ask which registry to use. Never default to a registry on behalf of the user.
9. **Switching presets** — Ask the user first: **overwrite**, **partial**, **merge**, or **skip**?

## Updating Components

When the user asks to update a component from upstream while keeping their local changes, use `--dry-run` and `--diff` to intelligently merge. **NEVER fetch raw files from GitHub manually — always use the CLI.**

1. Run `npx shadcn@latest add <component> --dry-run` to see all files that would be affected.
2. For each file, run `npx shadcn@latest add <component> --diff <file>` to see what changed upstream vs local.
3. Decide per file based on the diff:
   - No local changes → safe to overwrite.
   - Has local changes → read the local file, analyze the diff, and apply upstream updates while preserving local modifications.
   - User says "just update everything" → use `--overwrite`, but confirm first.
4. **Never use `--overwrite` without the user's explicit approval.**

## Quick Reference

```bash
# Add components.
npx shadcn@latest add button card dialog
npx shadcn@latest add @magicui/shimmer-button
npx shadcn@latest add --all

# Preview changes before adding/updating.
npx shadcn@latest add button --dry-run
npx shadcn@latest add button --diff button.tsx

# Search registries.
npx shadcn@latest search @shadcn -q "sidebar"
npx shadcn@latest search @tailark -q "stats"

# Get component docs and example URLs.
npx shadcn@latest docs button dialog select

# View registry item details (for items not yet installed).
npx shadcn@latest view @shadcn/button
```
