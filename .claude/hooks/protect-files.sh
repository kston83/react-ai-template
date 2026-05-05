#!/usr/bin/env bash
# Hook: protect-files.sh
# Blocks edits to files that should not be modified directly by an agent.
# Receives tool input as JSON on stdin.

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.filePath // ""')

# Normalize path separators
FILE_PATH=$(echo "$FILE_PATH" | sed 's|\\|/|g')

# Protected patterns
PROTECTED_PATTERNS=(
  "package-lock.json"
  "node_modules/"
  "dist/"
  ".claude/hooks/"
  ".env"
  ".env.local"
  ".env.production"
)

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$FILE_PATH" == *"$pattern"* ]]; then
    echo "{\"decision\": \"block\", \"reason\": \"Protected file: $FILE_PATH — do not edit directly\"}"
    exit 2
  fi
done
