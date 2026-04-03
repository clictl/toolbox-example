#!/usr/bin/env bash
# Generate a conventional commit message from staged changes.
# Usage: commit.sh [--dry-run]
set -euo pipefail

DRY_RUN=false
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
fi

# Check for staged changes
STAGED=$(git diff --cached --stat 2>/dev/null)
if [[ -z "$STAGED" ]]; then
  echo "Error: No staged changes found. Run 'git add' first."
  exit 1
fi

echo "Staged changes:"
echo "$STAGED"
echo ""

# Get the full diff for analysis
DIFF=$(git diff --cached)

# Detect change type from file paths and content
TYPE="chore"
if echo "$DIFF" | grep -q "^+.*test\|^+.*spec\|^+.*_test\."; then
  TYPE="test"
elif echo "$DIFF" | grep -q "^+.*\.md\|^+.*\.txt\|^+.*\.rst"; then
  TYPE="docs"
elif echo "$STAGED" | grep -q "new file"; then
  TYPE="feat"
elif echo "$DIFF" | grep -q "^-.*\|^+.*"; then
  TYPE="fix"
fi

# Count files changed
FILE_COUNT=$(echo "$STAGED" | grep -c "changed\|file" || echo "0")

echo "Suggested type: $TYPE"
echo "Files changed: $FILE_COUNT"
echo ""

if $DRY_RUN; then
  echo "[dry-run] Would commit with type: $TYPE"
  exit 0
fi

# Output the diff for the agent to analyze
echo "--- Full diff for analysis ---"
echo "$DIFF"
