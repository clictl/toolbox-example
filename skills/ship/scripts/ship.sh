#!/usr/bin/env bash
# Ship: stage, commit, push, and open a PR.
# Usage: ship.sh <commit-message> [--draft]
set -euo pipefail

MSG="${1:-}"
DRAFT=""
if [[ "${2:-}" == "--draft" ]]; then
  DRAFT="--draft"
fi

if [[ -z "$MSG" ]]; then
  echo "Usage: ship.sh <commit-message> [--draft]"
  exit 1
fi

# Safety checks
BRANCH=$(git branch --show-current)
if [[ "$BRANCH" == "main" || "$BRANCH" == "master" ]]; then
  echo "Error: Cannot ship directly from $BRANCH. Create a feature branch first."
  exit 1
fi

# Check for unstaged changes
STATUS=$(git status --porcelain)
if [[ -z "$STATUS" ]]; then
  echo "No changes to ship."
  exit 0
fi

echo "Changes to ship:"
git status --short
echo ""

# Stage all changes
git add -A

# Commit
git commit -m "$MSG"

# Push
git push -u origin HEAD

# Open PR
if command -v gh &>/dev/null; then
  gh pr create --fill $DRAFT
else
  echo "Install gh CLI to auto-create PRs: https://cli.github.com"
  echo "Push complete. Open a PR manually."
fi
