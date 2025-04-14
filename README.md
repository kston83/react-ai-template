# AI-Ready React Template

<p align="center">
  <img src="public/vite.svg" alt="AI-Ready React Template" width="100" />
</p>

<p align="center">
  A modern, feature-based React 19 template designed specifically for AI-assisted development
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#getting-started">Getting Started</a> •
  <a href="#project-structure">Project Structure</a> •
  <a href="#development-with-ai">Development with AI</a> •
  <a href="#tech-stack">Tech Stack</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#license">License</a>
</p>

## Overview

This template is specifically engineered to optimize the developer experience when working with AI coding assistants like GitHub Copilot, Cursor, or similar tools. It provides a structured, feature-based architecture with clear conventions that AI tools can understand and follow consistently, leveraging the latest features of React 19 and Tailwind CSS v4.



## Features

- **AI-Optimized Structure**: Clear organization patterns that AI tools can consistently follow (see `.cursor/rules/`)
- **Feature-Based Architecture**: Self-contained feature modules for intuitive code organization
- **Scalable Patterns**: Well-documented patterns for React 19 hooks, components, and state management
- **Developer Experience**: Modern tooling with TypeScript, ESLint 9 (flat config), Vite, and structured testing
- **Comprehensive Guidelines**: Detailed rules in `.cursor/rules/` and `ai/` directory serve as documentation for both developers and AI
- **Phased Implementation Plan**: Clear roadmap for implementing features in a structured way

## Getting Started

### Prerequisites

- Node.js 18.x or higher
- npm 8.x or higher

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/ai-ready-react-template.git my-project

# Navigate to the project
cd my-project

# Install dependencies
npm install

# Start development server
npm run dev
```

Visit http://localhost:5173 to view your application.

## Project Structure

```
.cursor/rules/      # AI guidance rules (Recommended: create if not present)
ai/                 # AI-related documentation (PRDs, Plans, Prompts)
src/
├── components/       # Shared UI components (usually shadcn/ui)
├── context/          # React context providers
├── features/         # Feature modules
│   └── [feature-name]/
│       ├── components/
│       ├── hooks/
│       ├── utils/
│       └── types.ts
├── hooks/            # Shared custom hooks
├── lib/              # Shared libraries (e.g., utils.ts)
├── styles/           # Global styles (usually just index.css)
├── types/            # Global TypeScript type definitions
└── utils/            # Global utility functions
```

## Key Architectural Patterns

- **Feature-Based Organization**: Features are encapsulated in self-contained modules.
- **Component Composition**: Build complex UIs with composable, focused components using Shadcn UI and Tailwind v4.
- **Custom Hooks & React 19**: Extract business logic into reusable hooks, leveraging React 19 features like the use hook where appropriate.
- **Tiered State Management**: Clear guidelines for local, feature (Context API), and potentially global state (e.g., Zustand).

## Development with AI

### AI Workflow

1. **Plan First**: Begin with a clear plan (see ai/plan.md).
2. **Use Structure**: Follow the feature-based organization for new code.
3. **Reference Guidelines**: AI should reference `.cursor/rules/` for project conventions and patterns.
4. **Document As You Go**: Add documentation for completed features in `ai/docs/` following the example.

### Effective AI Prompts

When working with AI coding assistants, provide context by referencing the rules directory:

- "Following the project structure in `.cursor/rules/2-structure.md` and React patterns in `.cursor/rules/3-react-patterns.md`, create a new feature called [name] that..."
- "Based on the styling patterns in `.cursor/rules/4-styling-patterns.md`, style the [ComponentName] using Tailwind CSS v4 utilities. Use `size-*` instead of `w-*` and `h-*`."
- "Create a hook `useAsyncData` that uses the React 19 `use` hook to read the promise state, following the patterns in `.cursor/rules/3-react-patterns.md`."
- "Create tests for this component following the testing patterns in `.cursor/rules/5-testing-patterns.md`."

## Tech Stack

- **Framework**: React 19 with TypeScript
- **Build Tool**: Vite
- **Styling**: Tailwind CSS v4
- **UI Components**: shadcn/ui
- **Routing**: React Router DOM (or other if added)
- **State Management**: React Context, Zustand (optional)
- **Data Fetching**: React Query (or other if added)
- **Forms**: React Hook Form with Zod validation (or other if added)
- **Linting/Formatting**: ESLint 9 (Flat Config), Prettier (if added)
- **Testing**: Vitest, React Testing Library (or other if added)

## Contributing

Contributions are welcome! Please see CONTRIBUTING.md for details.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspired by best practices from the React community
- Built with modern tooling for optimal developer experience
- Designed to leverage the power of AI coding assistants