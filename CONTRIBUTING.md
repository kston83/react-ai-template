# Contributing to the AI-Ready React Template

Thank you for your interest in contributing to this project! This guide will help you get started with the development process.

## Development Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/your-username/ai-ready-react-template.git
   cd ai-ready-react-template
   ```
3. Install dependencies:
   ```bash
   npm install
   ```
4. Start the development server:
   ```bash
   npm run dev
   ```

## Project Structure

Please familiarize yourself with the project structure as outlined in the README.md and the `.cursor/rules/` directory. This will help you understand where new code should be placed.

## Adding Features

When adding new features, follow these guidelines:

1. Create a new feature directory in `src/features/[feature-name]`
2. Structure your feature following the established patterns:
   - Components in `components/`
   - Hooks in `hooks/`
   - Utils in `utils/`
   - Types in `types.ts`
3. Document your feature in `ai/docs/[feature-name].md`

## Pull Request Process

1. Create a branch for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```
2. Make your changes following the project's coding standards
3. Add tests for your changes
4. Update documentation as necessary
5. Ensure all tests pass:
   ```bash
   npm run test
   ```
6. Commit your changes with a descriptive commit message
7. Push your branch to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```
8. Create a Pull Request against the main repository

## Code Standards

- Follow the TypeScript guidelines in the project
- Write tests for all new functionality
- Document your code with JSDoc comments
- Keep components focused and composable
- Follow the established patterns in the codebase

## Testing

- Write tests for components, hooks, and utilities
- Co-locate tests with the code they test
- Follow the testing patterns in `.cursor/rules/4-testing.mdc`
- Run tests before submitting PRs:
  ```bash
  npm run test
  ```

## Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages:

- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc)
- `refactor:` Code changes that neither fix bugs nor add features
- `test:` Adding or updating tests
- `chore:` Changes to the build process or tools

## Need Help?

If you have questions or need help with the contribution process, please open an issue or discussion in the repository.

Thank you for contributing!