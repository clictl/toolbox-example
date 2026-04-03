---
name: debug
description: Systematic debugging workflow for errors and failures
version: "1.0"
tags: [debugging, errors, troubleshooting, workflow]
---

# Debug

Systematic approach to diagnosing and fixing errors.

## When to Use

Use this skill when the user reports a bug, error message, test failure, or unexpected behavior.

## Instructions

1. **Reproduce**: Get the exact error message or unexpected behavior
   - Ask for the full error output if not provided
   - Identify the failing command or action

2. **Locate**: Find where the error originates
   - Read the stack trace bottom-to-top (most recent call last)
   - Identify the file and line number
   - Read the surrounding code for context

3. **Understand**: Determine why it fails
   - Check the input values at the failure point
   - Read the function's contract (what it expects vs what it got)
   - Check recent changes: `git log --oneline -5 -- <file>`
   - Check if the issue is in our code or a dependency

4. **Fix**: Apply the minimal correct fix
   - Fix the root cause, not the symptom
   - Do not add broad try/except or error suppression
   - If the fix is non-obvious, add a brief comment explaining why

5. **Verify**: Confirm the fix works
   - Run the original failing command
   - Run related tests
   - Check for regressions in adjacent functionality

## Rules

- Always read the actual error message before guessing
- Do not change code you have not read
- One fix per issue. Do not refactor while debugging.
- If the root cause is unclear after investigation, say so. Do not guess.
