---
name: commit
description: Generate conventional commit messages from staged changes
version: "1.0"
tags: [git, commit, conventional-commits, workflow]
---

# Commit Message Generator

Generate conventional commit messages from staged git changes.

## When to Use

Use this skill when the user asks you to commit changes, write a commit message, or stage and commit.

## Instructions

1. Run `git diff --cached --stat` to see what files are staged
2. Run `git diff --cached` to see the actual changes
3. Analyze the changes and determine the type:
   - `feat:` for new features
   - `fix:` for bug fixes
   - `refactor:` for code restructuring
   - `docs:` for documentation changes
   - `test:` for adding or updating tests
   - `chore:` for maintenance tasks
   - `style:` for formatting changes
4. Write a concise commit message following conventional commits format
5. The subject line should be under 72 characters
6. Add a body if the changes need explanation (separated by a blank line)
7. Run `git commit -m "<message>"` with the generated message

## Examples

```
feat: add user authentication with OAuth2

- Added login/logout endpoints
- Integrated Google OAuth provider
- Session tokens stored in encrypted cookies
```

```
fix: prevent race condition in cache invalidation
```

## Rules

- Never use em dashes in commit messages
- Focus on WHY, not WHAT (the diff shows what changed)
- If multiple unrelated changes are staged, suggest splitting into separate commits
- Always check `git status` first to confirm what is staged
