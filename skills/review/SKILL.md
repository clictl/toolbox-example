---
name: review
description: Perform code review on staged changes or pull requests
version: "1.0"
tags: [git, code-review, quality, workflow]
---

# Code Review

Perform structured code reviews on staged changes or pull request diffs.

## When to Use

Use this skill when the user asks you to review code, check a PR, or audit changes.

## Instructions

1. Determine the scope:
   - If reviewing staged changes: `git diff --cached`
   - If reviewing a PR: `gh pr diff <number>`
   - If reviewing recent commits: `git log --oneline -10` then `git diff HEAD~N..HEAD`

2. For each file changed, check:
   - **Correctness**: Does the logic do what it claims?
   - **Security**: SQL injection, XSS, command injection, hardcoded secrets
   - **Error handling**: Are errors caught and handled appropriately?
   - **Edge cases**: Nil/null checks, empty inputs, boundary conditions
   - **Naming**: Are variables and functions named clearly?
   - **Tests**: Are new code paths covered by tests?

3. Format your review as:
   ```
   ## Summary
   One-sentence overview of the changes.

   ## Findings
   - [severity] file:line - description

   ## Verdict
   APPROVE / REQUEST_CHANGES / COMMENT
   ```

4. Severity levels:
   - `[critical]` - Must fix before merge (security, data loss, crash)
   - `[warning]` - Should fix (bugs, missing error handling)
   - `[suggestion]` - Nice to have (style, performance, readability)
   - `[praise]` - Good patterns worth calling out

## Rules

- Be specific. Reference file names and line numbers.
- Do not suggest changes outside the scope of the diff.
- If the code is good, say so. Not every review needs findings.
- Never rewrite large sections of code. Point out issues and let the author fix them.
