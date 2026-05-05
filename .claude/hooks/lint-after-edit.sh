#!/usr/bin/env bash
# Hook: lint-after-edit.sh
# Runs ESLint on edited .ts/.tsx files after each edit.
# Receives tool input as JSON on stdin.

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.filePath // ""')

# Normalize path separators
FILE_PATH=$(echo "$FILE_PATH" | sed 's|\\|/|g')

# Only lint TypeScript files
if [[ "$FILE_PATH" == *.ts || "$FILE_PATH" == *.tsx ]]; then
  # Run eslint on the specific file, suppress exit code (advisory, not blocking)
  npx eslint "$FILE_PATH" --fix --quiet 2>/dev/null || true
fi
