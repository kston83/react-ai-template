# AI-Ready React Template

<p align="center">
  <img src="public/vite.svg" alt="AI-Ready React Template" width="100" />
</p>

<p align="center">
  A modern, feature-based React template designed specifically for AI-assisted development
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

This template is specifically engineered to optimize the developer experience when working with AI coding assistants like GitHub Copilot, Cursor, or similar tools. It provides a structured, feature-based architecture with clear conventions that AI tools can understand and follow consistently.

## Features

- **AI-Optimized Structure**: Clear organization patterns that AI tools can consistently follow
- **Feature-Based Architecture**: Self-contained feature modules for intuitive code organization
- **Scalable Patterns**: Well-documented patterns for hooks, components, and state management
- **Developer Experience**: Modern tooling with TypeScript, ESLint, and structured testing
- **Comprehensive Guidelines**: Detailed rules that serve as documentation for both developers and AI
- **Phased Implementation Plan**: Clear roadmap for implementing features in a structured way

## Getting Started

### Prerequisites

- Node.js 18.x or higher
- npm 8.x or higher

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/ai-ready-react-template.git my-project

# Navigate to the project
cd my-project

# Install dependencies
npm install

# Start development server
npm run dev
```

Visit [http://localhost:5173](http://localhost:5173) to view your application.

## Project Structure

```
src/
├── components/       # Shared UI components
├── context/          # React context providers
├── features/         # Feature modules
│   └── [feature-name]/
│       ├── components/
│       ├── hooks/
│       ├── utils/
│       └── types.ts
├── hooks/            # Shared custom hooks
├── lib/              # Shared libraries
├── styles/           # Global styles
├── types/            # TypeScript type definitions
└── utils/            # Utility functions
```

### Key Architectural Patterns

- **Feature-Based Organization**: Features are encapsulated in self-contained modules
- **Component Composition**: Build complex UIs with composable, focused components
- **Custom Hooks**: Extract business logic into reusable hooks
- **Tiered State Management**: Clear guidelines for local, feature, and global state

## Development with AI

This template is designed to work seamlessly with AI coding assistants:

### AI Workflow

1. **Plan First**: Begin with a clear plan (see `ai/plan.md`)
2. **Use Structure**: Follow the feature-based organization for new code
3. **Reference Guidelines**: AI can reference `.cursor/rules/` for project conventions
4. **Document As You Go**: Add documentation for completed features in `ai/docs/`

### Effective AI Prompts

When working with AI coding assistants, try these prompt patterns:

```
"Following the project structure in `.cursor/rules/`, create a new feature called [name] that..."

"Based on the existing patterns in the project, implement a custom hook for..."

"Create a test for this component following the testing patterns in `.cursor/rules/4-testing.mdc`"
```

## Tech Stack

- **Framework**: React 18 with TypeScript
- **Build Tool**: Vite
- **Styling**: Tailwind CSS
- **UI Components**: shadcn/ui
- **Routing**: React Router DOM
- **State Management**: React Context, Zustand (optional)
- **Data Fetching**: React Query
- **Forms**: React Hook Form with Zod validation
- **Testing**: Vitest, React Testing Library, and Jest-DOM

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by best practices from the React community
- Built with modern tooling for optimal developer experience
- Designed to leverage the power of AI coding assistants