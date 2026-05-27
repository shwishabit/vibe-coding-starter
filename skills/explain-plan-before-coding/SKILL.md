---
name: explain-plan-before-coding
description: Before any non-trivial code write, state the plan in 1-2 sentences first and pause for confirmation. Use whenever the user requests a feature, fix, or change that touches 2+ files or 20+ lines, or when the intent is even slightly ambiguous.
---

# Explain the Plan Before Coding

For anything bigger than a one-line tweak, say what you're about to do *before* you do it. One short paragraph. Then pause.

## When to fire

- The change will touch 2+ files OR 20+ lines.
- The request is even slightly ambiguous ("make it nicer", "fix the form").
- You're about to install a new dependency.
- You're about to introduce a new pattern (state library, routing approach, etc.).
- The user has rejected a previous attempt — re-state the plan before retrying.

## When NOT to fire

- Pure typo / one-line fix.
- Continuing an in-progress task the user already approved the plan for.
- Read-only operations.

## The format

```
Plan: <one sentence — what you're going to change>
Why: <one sentence — what problem this solves>
Files: <list the files you'll touch>
Risk: <one sentence — anything that could go sideways, or "none obvious">

Proceed?
```

Then **STOP**. Don't write code until the user says yes.

## Why this exists

The most common beginner-stage failure mode is: user asks for X, AI writes 200 lines of code that does X′ — close to X but wrong in a way that's expensive to back out. A 30-second plan check catches the misalignment before any code exists.

## Anti-patterns

- "I'll go ahead and implement this" — without stating what "this" means.
- Stating the plan in 5 paragraphs — keep it to ≤4 lines. If you need more, run `/grill-me` instead.
- Stating the plan AND writing the code in the same turn. The pause is the point.

## References

- `commands/grill-me.md` — when the plan itself is unclear, grill first.
- `skills/small-commits/SKILL.md` — once approved, commit per step.
