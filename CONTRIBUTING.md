# Contributing to the AI-Ready React Template

Thank you for your interest in contributing to this project! This guide will help you get started with the development process for this React 19 / Tailwind v4 template.

## Development Setup

1.  Fork the repository
2.  Clone your fork:
    ```bash
    git clone [https://github.com/your-username/ai-ready-react-template.git](https://github.com/your-username/ai-ready-react-template.git)
    cd ai-ready-react-template
    ```
3.  Install dependencies:
    ```bash
    npm install
    ```
4.  Start the development server:
    ```bash
    npm run dev
    ```

## Project Structure

Please familiarize yourself with the project structure as outlined in the `README.md` and the AI guidance rules in the `.cursor/rules/` directory [cite: react-template-ai/README.md]. This will help you understand where new code should be placed.

Key directories:
- `.cursor/rules/`: AI guidance files (essential context for AI tools)
- `ai/`: High-level documentation (PRD, Plan, Prompts) [cite: react-template-ai/ai/prd.md, react-template-ai/ai/plan.md, react-template-ai/ai/example-prompts.md]
- `src/features/[feature-name]`: Self-contained feature modules [cite: react-template-ai/ai/docs/example-feature.md]
- `src/components/`: Shared components, including `ui` from shadcn [cite: react-template-ai/components.json]
- `src/lib/`: Shared utilities like `cn` [cite: react-template-ai/src/lib/utils.ts]

## Adding Features

When adding new features, follow these guidelines:

1.  Create a new feature directory in `src/features/[feature-name]`
2.  Structure your feature following the established patterns (see `.cursor/rules/2-structure.md`):
    - Components in `components/`
    - Hooks in `hooks/`
    - Utils in `utils/`
    - Types in `types.ts`
3.  Adhere to React 19 and Tailwind v4 patterns described in `.cursor/rules/`.
4.  Document your feature in `ai/docs/[feature-name].md` following the example [cite: react-template-ai/ai/docs/example-feature.md].

## Pull Request Process

1.  Create a branch for your changes:
    ```bash
    git checkout -b feature/your-feature-name
    ```
2.  Make your changes following the project's coding standards (refer to `.cursor/rules/`)
3.  Add tests for your changes (see `.cursor/rules/5-testing-patterns.md`)
4.  Update documentation as necessary (`ai/docs/`, relevant `.cursor/rules/` if patterns change)
5.  Ensure all checks pass (linting, tests):
    ```bash
    npm run lint
    npm run test # Add test script if you have one
    ```
6.  Commit your changes with a descriptive commit message (Conventional Commits preferred)
7.  Push your branch to your fork:
    ```bash
    git push origin feature/your-feature-name
    ```
8.  Create a Pull Request against the main repository

## Code Standards

- Follow TypeScript guidelines (see `tsconfig.app.json`) [cite: react-template-ai/tsconfig.app.json]
- Write tests for all new functionality
- Document your code with JSDoc comments where appropriate
- Keep components focused and composable
- Follow the established patterns in the codebase and `.cursor/rules/`

## Testing

- Write tests using the project's testing framework (e.g., Vitest/RTL)
- Co-locate tests with the code they test (e.g., `ComponentName.test.tsx`)
- Follow the testing patterns outlined in `.cursor/rules/5-testing-patterns.md`
- Run tests before submitting PRs

## Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages:

- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation changes (including `.cursor/rules/` and `ai/`)
- `style:` Code style changes (formatting, etc)
- `refactor:` Code changes that neither fix bugs nor add features
- `test:` Adding or updating tests
- `chore:` Changes to the build process or tools

## Need Help?

If you have questions or need help with the contribution process, please open an issue or discussion in the repository.

Thank you for contributing!