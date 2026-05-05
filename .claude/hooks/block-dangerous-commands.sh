#!/usr/bin/env bash
# Hook: block-dangerous-commands.sh
# Blocks dangerous shell commands before they execute.
# Receives tool input as JSON on stdin.

set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')

# Block force push
if echo "$COMMAND" | grep -qE 'git\s+push\s+(-f|--force)'; then
  echo "{\"decision\": \"block\", \"reason\": \"Force push is blocked. Use normal push or ask the user.\"}"
  exit 2
fi

# Block push to main/master without explicit intent
if echo "$COMMAND" | grep -qE 'git\s+push\s+(origin\s+)?(main|master)'; then
  echo "{\"decision\": \"block\", \"reason\": \"Direct push to main/master is blocked. Create a branch and PR.\"}"
  exit 2
fi

# Block destructive commands
if echo "$COMMAND" | grep -qE 'rm\s+-rf\s+(/|~|\.\.|[*])'; then
  echo "{\"decision\": \"block\", \"reason\": \"Destructive rm -rf is blocked.\"}"
  exit 2
fi

# Block hard reset
if echo "$COMMAND" | grep -qE 'git\s+reset\s+--hard'; then
  echo "{\"decision\": \"block\", \"reason\": \"Hard reset is blocked. Use soft reset or ask the user.\"}"
  exit 2
fi

# Block curl pipe to shell
if echo "$COMMAND" | grep -qE 'curl.*\|\s*(ba)?sh'; then
  echo "{\"decision\": \"block\", \"reason\": \"Piping curl to shell is blocked for security.\"}"
  exit 2
fi
