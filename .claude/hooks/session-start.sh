#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# Install workspace dependencies (non-frozen so the cached container can reuse the store).
pnpm install

# Build all packages: cross-package typecheck (`pnpm -r typecheck`) resolves
# workspace deps through their built dist/ output.
pnpm build
