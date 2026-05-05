#!/usr/bin/env bash
# Hook: scan-secrets.sh
# Scans file content for potential secrets/credentials before write.
# Receives tool input as JSON on stdin.

set -euo pipefail

INPUT=$(cat)
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.newString // ""')

if [ -z "$CONTENT" ]; then
  exit 0
fi

# Patterns that indicate secrets
SECRET_PATTERNS=(
  'AKIA[0-9A-Z]{16}'           # AWS Access Key
  'sk-[a-zA-Z0-9]{20,}'        # OpenAI/Stripe secret key
  'ghp_[a-zA-Z0-9]{36}'        # GitHub personal access token
  'gho_[a-zA-Z0-9]{36}'        # GitHub OAuth token
  'xox[baprs]-[a-zA-Z0-9-]+'   # Slack token
  'eyJ[a-zA-Z0-9_-]*\.'        # JWT token (long enough to be real)
)

for pattern in "${SECRET_PATTERNS[@]}"; do
  if echo "$CONTENT" | grep -qE "$pattern"; then
    echo "{\"decision\": \"block\", \"reason\": \"Potential secret/credential detected in file content. Do not commit secrets to code.\"}"
    exit 2
  fi
done
