---
name: vercel-composition-patterns
description: React composition patterns for scaling components and avoiding boolean prop proliferation.
license: MIT
metadata:
  source: vercel-labs/agent-skills
---

# React Composition Patterns

Composition patterns for building flexible, maintainable React components. Avoid boolean prop proliferation by using compound components, lifting state, and composing internals. These patterns make codebases easier for both humans and AI agents to work with as they scale.

## When to Apply

Reference these guidelines when:

- Refactoring components with many boolean props
- Building reusable component libraries
- Designing flexible component APIs
- Reviewing component architecture
- Working with compound components or context providers

## Rule Categories by Priority

| Priority | Category | Impact | Prefix |
|----------|----------|--------|--------|
| 1 | Component Architecture | HIGH | `architecture-` |
| 2 | State Management | MEDIUM | `state-` |
| 3 | Implementation Patterns | MEDIUM | `patterns-` |
| 4 | React 19 APIs | MEDIUM | `react19-` |

## Quick Reference

### 1. Component Architecture (HIGH)

- `architecture-avoid-boolean-props` - Don't add boolean props to customize behavior; use composition
- `architecture-compound-components` - Structure complex components with shared context

### 2. State Management (MEDIUM)

- `state-decouple-implementation` - Provider is the only place that knows how state is managed
- `state-context-interface` - Define generic interface with state, actions, meta for dependency injection
- `state-lift-state` - Move state into provider components for sibling access

### 3. Implementation Patterns (MEDIUM)

- `patterns-explicit-variants` - Create explicit variant components instead of boolean modes
- `patterns-children-over-render-props` - Use children for composition instead of renderX props

### 4. React 19 APIs (MEDIUM)

> **React 19+ only.** Skip this section if using React 18 or earlier.

- `react19-no-forwardref` - Don't use `forwardRef`; use `use()` instead of `useContext()`

---

## architecture-avoid-boolean-props

Don't add boolean props to customize component behavior. Use composition instead.

**Incorrect:**

```tsx
function Modal({ isFullScreen, hasCloseButton, isScrollable, showOverlay, children }) {
  return (
    <div className={cn("modal", isFullScreen && "modal-full", isScrollable && "modal-scroll")}>
      {showOverlay && <div className="overlay" />}
      {children}
      {hasCloseButton && <button>Close</button>}
    </div>
  )
}

<Modal isFullScreen hasCloseButton isScrollable showOverlay>
  <p>Content</p>
</Modal>
```

**Correct:**

```tsx
function Modal({ children }) {
  return <div className="modal">{children}</div>
}

function ModalOverlay() {
  return <div className="overlay" />
}

function ModalCloseButton() {
  return <button>Close</button>
}

<Modal>
  <ModalOverlay />
  <ModalCloseButton />
  <p>Content</p>
</Modal>
```

---

## architecture-compound-components

Structure complex components with shared context so parts communicate without prop drilling.

**Incorrect:**

```tsx
<Tabs
  items={[
    { label: "Tab 1", content: <Panel1 /> },
    { label: "Tab 2", content: <Panel2 /> },
  ]}
  activeTab={0}
  onTabChange={setTab}
/>
```

**Correct:**

```tsx
<Tabs defaultValue="tab1">
  <TabsList>
    <TabsTrigger value="tab1">Tab 1</TabsTrigger>
    <TabsTrigger value="tab2">Tab 2</TabsTrigger>
  </TabsList>
  <TabsContent value="tab1"><Panel1 /></TabsContent>
  <TabsContent value="tab2"><Panel2 /></TabsContent>
</Tabs>
```

---

## state-decouple-implementation

The provider is the only place that knows how state is managed. Consumers use the context interface without caring about the implementation.

**Incorrect:**

```tsx
// Component directly manages state and passes it around
function App() {
  const [items, setItems] = useState([])
  const [filter, setFilter] = useState("")

  return (
    <ItemList items={items} setItems={setItems} filter={filter} setFilter={setFilter} />
  )
}
```

**Correct:**

```tsx
// Provider encapsulates state management
function ItemProvider({ children }) {
  const [items, setItems] = useState([])
  const [filter, setFilter] = useState("")

  const value = {
    state: { items, filter },
    actions: { addItem: (item) => setItems(prev => [...prev, item]), setFilter },
  }

  return <ItemContext value={value}>{children}</ItemContext>
}

// Consumer only knows about the interface
function ItemList() {
  const { state, actions } = use(ItemContext)
  // ...
}
```

---

## state-context-interface

Define a generic interface with `state`, `actions`, and `meta` for dependency injection.

```tsx
type ContextValue<S, A, M = undefined> = {
  state: S
  actions: A
  meta?: M
}

// Example
type CartContext = ContextValue<
  { items: CartItem[]; total: number },
  { addItem: (item: CartItem) => void; removeItem: (id: string) => void; clear: () => void },
  { currency: string }
>
```

---

## state-lift-state

Move state into provider components for sibling access rather than passing callbacks through intermediaries.

**Incorrect:**

```tsx
function Parent() {
  const [selected, setSelected] = useState(null)
  return (
    <>
      <Sidebar onSelect={setSelected} />
      <Detail item={selected} />
    </>
  )
}
```

**Correct:**

```tsx
function SelectionProvider({ children }) {
  const [selected, setSelected] = useState(null)
  return (
    <SelectionContext value={{ selected, setSelected }}>
      {children}
    </SelectionContext>
  )
}

function Parent() {
  return (
    <SelectionProvider>
      <Sidebar />
      <Detail />
    </SelectionProvider>
  )
}
```

---

## patterns-explicit-variants

Create explicit variant components instead of boolean modes.

**Incorrect:**

```tsx
<Button isPrimary isLarge isLoading>Submit</Button>
```

**Correct:**

```tsx
// Use CVA or explicit variant props
<Button variant="primary" size="lg">
  <Spinner data-icon="inline-start" />
  Submit
</Button>
```

---

## patterns-children-over-render-props

Use `children` for composition instead of `renderX` props.

**Incorrect:**

```tsx
<List
  renderItem={(item) => <ItemCard item={item} />}
  renderEmpty={() => <EmptyState />}
  renderHeader={() => <h2>Items</h2>}
/>
```

**Correct:**

```tsx
<List>
  <ListHeader><h2>Items</h2></ListHeader>
  {items.length === 0 ? (
    <EmptyState />
  ) : (
    items.map(item => <ItemCard key={item.id} item={item} />)
  )}
</List>
```

---

## react19-no-forwardref

In React 19, `ref` is a regular prop. Don't use `forwardRef`. Use `use()` instead of `useContext()`.

**Incorrect (React 18 pattern):**

```tsx
import { forwardRef, useContext } from 'react'

const Input = forwardRef<HTMLInputElement, InputProps>((props, ref) => {
  const theme = useContext(ThemeContext)
  return <input ref={ref} {...props} />
})
```

**Correct (React 19):**

```tsx
import { use } from 'react'

function Input({ ref, ...props }: InputProps & { ref?: React.Ref<HTMLInputElement> }) {
  const theme = use(ThemeContext)
  return <input ref={ref} {...props} />
}
```
