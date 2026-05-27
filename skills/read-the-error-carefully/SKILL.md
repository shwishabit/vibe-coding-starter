---
name: read-the-error-carefully
description: When an error appears in terminal output, build logs, or browser console, quote the specific failing line and interpret it before suggesting fixes. Use whenever an error message, stack trace, exit code, or red text appears.
---

# Read the Error Carefully

90% of beginner-stage debugging time is wasted because nobody actually read what the error said. The error usually contains the answer.

## When to fire

- Any error appears in terminal, build log, browser console, or test output.
- An exit code is non-zero.
- A request shows a 4xx / 5xx response.
- A red squiggly appears in the editor.

## The four-step read

### 1. Quote the actual failing line

Not "there's an error" — the exact line. Copy it. Example:

> `TypeError: Cannot read properties of undefined (reading 'map') at ProductList.tsx:14`

### 2. Identify what's actually being said

Translate it into plain English:

> "At line 14 of ProductList.tsx, something is undefined, and we're trying to call `.map()` on it. The thing we're mapping doesn't exist."

### 3. Find the *first* error

Build / compile output often shows 50 errors. The first one is usually the real one — the rest are downstream cascades. Scroll up, find the first red line, fix that one, re-run.

### 4. Then form a hypothesis

Only after steps 1–3. Examples:

- "The API returned undefined instead of an array" → check the fetch.
- "The prop wasn't passed" → check the parent component.
- "The file imports from a path that doesn't exist" → check the import line.

## Anti-patterns

- "Try X" without quoting the error. If you can't quote it, you didn't read it.
- Fixing error #5 in a list of 50. Fix #1 first.
- Pasting the whole stack trace and asking the AI to figure it out. Quote the relevant line, then ask.
- "It's probably a typo" — confirm with the error message.

## When NOT to use

- The error is a known one with a documented fix (e.g. "EADDRINUSE" = port taken).
- The user explicitly said "skip the diagnosis, just try X."

## References

- `skills/diagnose/SKILL.md` — when the error read isn't enough, escalate to the full diagnosis loop.
