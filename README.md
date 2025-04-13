AI-Ready Frontend Template
A modern React frontend template designed for AI-assisted development using Cursor and other AI development tools.

Tech Stack
Framework: React 18 with TypeScript
Build Tool: Vite
Styling: Tailwind CSS
UI Components: shadcn/ui
AI Integration: Cursor-optimized structure with rules, docs, and planning
Project Structure
This project follows a feature-based organization pattern optimized for AI-assisted development:

src/
├── components/        # Shared UI components
├── context/           # React context providers
├── features/          # Feature modules
├── hooks/             # Custom React hooks
├── lib/               # Shared libraries
├── styles/            # Global styles
├── types/             # TypeScript types
└── utils/             # Utility functions
AI-Assisted Development
This template is structured specifically for effective AI collaboration:

The AI Workflow
Plan First: Begin with a clear plan in ai/plan.md
Document Requirements: Define requirements in ai/prd.md
Vertical Slices: Implement one feature at a time from database to UI
Document as You Go: Create documentation in ai/docs/ for each completed feature
Use AI Rules: Leverage .cursor/rules to provide context to your AI assistant
Rules For AI
The .cursor/rules directory contains guidance for AI tools:

Project conventions
Coding patterns
Import rules
Component organization
Best practices
These rules help AI tools generate more accurate, consistent code that follows the project's patterns.

How to Use This Template with AI
When working with AI on this codebase:

Reference the Plan: Mention "Follow the plan in ai/plan.md" when asking for implementations
Provide Phase Context: Specify "We're working on Phase X from the plan..."
Prompt for Documentation: After implementation, ask AI to "Create documentation for this feature in ai/docs/"
Consider Alternatives: Ask "What are 3-5 approaches to this problem?" before deciding
Review Changes: Always review AI-generated code before committing
Getting Started
Clone this repository
Install dependencies:
bash
cd frontend
npm install
Start the development server:
bash
npm run dev
Open the browser at http://localhost:5173
Available Scripts
npm run dev - Start development server
npm run build - Build for production
npm run preview - Preview production build locally
npm run lint - Run ESLint
npm run typecheck - Run TypeScript type checking
Adding shadcn/ui Components
bash
npx shadcn-ui@latest add button
Customizing Theme
Edit the tailwind.config.js file to customize colors, fonts, and other design tokens.

