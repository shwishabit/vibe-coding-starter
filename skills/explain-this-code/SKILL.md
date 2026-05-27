---
name: explain-this-code
description: Walk through an unfamiliar file or function in plain English — what it does, what the load-bearing pieces are, what could go wrong. Use when the user says "explain this", "what does this do", "I don't understand this file", or pastes code asking for a read.
---

# Explain This Code

A learning-aid skill. The user is trying to understand something — don't just summarize, teach.

## When to fire

- "Explain this file / function / line."
- "What does this do?"
- "I don't understand X."
- User opens a file in their editor and asks for context.

## The structure

Three short sections. Don't pad.

**1. The one-line summary.**
What this code does, in one sentence. No jargon unless the user has used it first.

**2. The walk.**
Go through it in execution order — top to bottom, or call order if it's a function chain. For each meaningful chunk:
- Quote 1-3 lines (file:line).
- Say what it does in plain English.
- Name the *why* if it's non-obvious.

Skip the boring parts. Imports, boilerplate, getters/setters — say "imports + boilerplate" and move on.

**3. What's load-bearing.**
The 1-3 pieces that, if you changed them, would break the most. Often: a state shape, a public API surface, a side-effect.

**Optional fourth section, only if relevant:**
*What could go wrong* — known failure modes, edge cases the code doesn't handle, technical debt the author left.

## Tone

- Plain English. Translate jargon, don't use it.
- Honest about uncertainty: "I think this is meant to..." beats fake confidence.
- If the code is bad, say so + name the smell. Don't pretend it's fine.

## When NOT to use

- The user wants to *change* the code, not understand it — that's a different mode.
- One-line lookups ("what does `Array.prototype.flat` do?") — too short for the structure; just answer.
- Code the user wrote 5 minutes ago — they don't need the walk, they need a review.

## References

- `skills/diagnose/SKILL.md` — when the goal is finding a bug, not understanding the structure.
