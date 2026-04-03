---
name: ship
description: Stage, commit, push, and open a pull request in one flow
version: "1.0"
tags: [git, shipping, pull-request, workflow]
---

# Ship

One-command shipping workflow: stage changes, commit, push, and open a PR.

## When to Use

Use this skill when the user says "ship it", "open a PR", "push this", or wants to go from local changes to a pull request.

## Instructions

1. **Check state**:
   - Run `git status` to see what changed
   - Run `git branch --show-current` to confirm the branch
   - If on main/master, create a feature branch first: `git checkout -b <branch-name>`

2. **Stage**:
   - Review unstaged changes with `git diff --stat`
   - Stage relevant files with `git add <files>`
   - Do not stage .env, credentials, or generated files
   - If everything looks clean: `git add -A`

3. **Commit**:
   - Generate a conventional commit message (see commit skill)
   - Run `git commit -m "<message>"`

4. **Push**:
   - Push to remote: `git push -u origin HEAD`
   - If the branch does not exist upstream, this creates it

5. **Open PR**:
   - Run `gh pr create --fill` to auto-fill from commits
   - Or `gh pr create --title "<title>" --body "<body>"` for custom PR
   - Include a brief summary and test plan in the PR body

## Rules

- Never force push unless explicitly asked
- Never push directly to main/master
- If there are merge conflicts, stop and ask the user
- Always check `git status` before staging to avoid committing secrets
- If tests exist, suggest running them before pushing
