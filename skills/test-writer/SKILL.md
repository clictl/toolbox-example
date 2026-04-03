---
name: test-writer
description: Generate unit tests for functions and modules
version: "1.0"
tags: [testing, unit-tests, quality, tdd]
---

# Test Writer

Generate comprehensive unit tests for source code.

## When to Use

Use this skill when the user asks you to write tests, add test coverage, or create test files.

## Instructions

1. Read the source file the user wants to test
2. Identify all public functions, methods, and exported interfaces
3. For each function, generate tests covering:
   - **Happy path**: Normal inputs produce expected outputs
   - **Edge cases**: Empty inputs, zero values, nil/null, boundary values
   - **Error cases**: Invalid inputs, expected failures, error returns
   - **Type-specific**:
     - Strings: empty, unicode, very long, special characters
     - Numbers: zero, negative, max value, NaN
     - Collections: empty, single item, many items, duplicates
     - Files: missing, empty, permissions errors

4. Match the project's existing test patterns:
   - Python: use pytest (not unittest)
   - Go: use standard testing package, table-driven tests
   - JavaScript/TypeScript: match existing framework (jest, vitest, mocha)
   - Use existing test helpers and fixtures when available

5. Place the test file next to the source:
   - Python: `test_module.py` or `module_test.py`
   - Go: `module_test.go` (same package)
   - JS/TS: `module.test.ts` or `module.spec.ts`

## Rules

- Run the tests after writing them to verify they pass
- Do not mock internal functions unless necessary for isolation
- Prefer real dependencies over mocks when practical
- Each test should have a descriptive name explaining what it verifies
- Do not test private/unexported functions directly
