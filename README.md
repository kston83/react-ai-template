# AI-Ready React Template

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/f/f1/Vitejs-logo.svg" alt="AI-Ready React Template" width="100" />
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

<p align="center">
<img width="921" alt="image" src="https://github.com/user-attachments/assets/685cf435-d576-4c65-9fd0-8d1d935e8f2d" />
</p>

## Features

- **AI-Optimized Structure**: Clear organization patterns that AI tools can consistently follow (see `.claude/rules/`, `.github/copilot-instructions.md`, `AGENTS.md`)
- **Feature-Based Architecture**: Self-contained feature modules for intuitive code organization
- **Scalable Patterns**: Well-documented patterns for React 19 hooks, components, and state management
- **Developer Experience**: Modern tooling with TypeScript, ESLint 9 (flat config), Vite, and Husky/lint-staged
- **Comprehensive Guidelines**: Detailed rules in `.claude/rules/`, `AGENTS.md`, and `ai/` directory serve as documentation for both developers and AI
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
.claude/rules/      # AI guidance rules (Claude Code)
.github/            # GitHub Copilot instructions
ai/                 # AI-related documentation (PRDs, Plans, Prompts)
src/
├── components/       # Shared components
│   ├── layout/       # Layout components (e.g., mode-toggle)
│   ├── providers/    # React context providers (e.g., theme-provider)
│   └── ui/           # shadcn/ui components
├── features/         # Feature modules
│   └── [feature-name]/
│       ├── components/
│       ├── hooks/
│       ├── utils/
│       └── types.ts
└── lib/              # Shared libraries (e.g., utils.ts with cn())
```

## Key Architectural Patterns

- **Feature-Based Organization**: Features are encapsulated in self-contained modules.
- **Component Composition**: Build complex UIs with composable, focused components using Shadcn UI and Tailwind v4.
- **Custom Hooks & React 19**: Extract business logic into reusable hooks, leveraging React 19 features like the use hook where appropriate.
- **Tiered State Management**: Clear guidelines for local and feature-level (Context API) state.

## Development with AI

### AI Workflow

1. **Plan First**: Begin with a clear plan (see ai/plan.md).
2. **Use Structure**: Follow the feature-based organization for new code.
3. **Reference Guidelines**: AI should reference `.claude/rules/`, `AGENTS.md`, or `.github/copilot-instructions.md` for project conventions and patterns.
4. **Document As You Go**: Add documentation for completed features in `ai/docs/` following the example.

### Effective AI Prompts

When working with AI coding assistants, provide context by referencing the guidance files:

- "Following the project structure in `AGENTS.md` and React patterns in `.claude/rules/react-patterns.md`, create a new feature called [name] that..."
- "Based on the styling patterns in `.claude/rules/styling.md`, style the [ComponentName] using Tailwind CSS v4 utilities. Use `size-*` instead of `w-*` and `h-*`."
- "Create a hook `useAsyncData` that uses the React 19 `use` hook to read the promise state, following the patterns in `.claude/rules/react-patterns.md`."
- "Following `.claude/rules/feature-structure.md`, scaffold a new feature module for [name]."

## Tech Stack

- **Framework**: React 19 with TypeScript 5.7 (strict)
- **Build Tool**: Vite 6
- **Styling**: Tailwind CSS v4 (CSS-first config via `@theme` in `src/index.css`)
- **UI Components**: shadcn/ui (new-york style), Radix UI primitives
- **Icons**: Lucide React
- **Linting**: ESLint 9 (Flat Config)
- **Git Hooks**: Husky + lint-staged

## Contributing

Contributions are welcome! Please see CONTRIBUTING.md for details.

## License

This project is licensed under the MIT License.

## Acknowledgments

- Inspired by best practices from the React community
- Built with modern tooling for optimal developer experience
- Designed to leverage the power of AI coding assistants
