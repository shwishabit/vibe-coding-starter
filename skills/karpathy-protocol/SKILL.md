---
name: karpathy-protocol
description: Four-principle filter the AI applies before any code change — think first, simplicity first, surgical changes, goal-driven execution. Use as a global default and as a self-audit when invoked via /karpathy.
---

# Karpathy Protocol

A four-principle filter. Apply on every non-trivial change. Self-audit when the user types `/karpathy`.

## The four principles

**1. Think before coding.**
State assumptions. If there are multiple ways to read the request, surface them. Don't hide confusion — ask.

**2. Simplicity first.**
Minimum code that solves the problem. No speculative features, no abstractions for single-use logic, no flexibility no one asked for, no error handling for impossible scenarios. If 200 lines could be 50, write 50.

**3. Surgical changes.**
Touch only what's necessary. Don't refactor adjacent code that wasn't asked about. Match the existing style. Every changed line should trace back to something the user explicitly requested.

**4. Goal-driven execution.**
Know the success criterion before starting. For multi-step work, state a numbered plan with a verify step per item.

## How this fires

- **Silently, by default.** Run the filter mentally before any code write.
- **Explicitly, on `/karpathy`.** Do the four-principle self-audit out loud — one short paragraph per principle, naming what's clean and what's at risk.
- **Drift correction.** If the user's request starts to drift (broad refactor, speculative abstraction, large rewrite), gently name the principle at stake and propose the minimal path.

## When NOT to use

- Trivial one-line fixes (typo, rename) — judgment over ceremony.
- Pure exploration or "how does X work" questions.

## References

- `commands/karpathy.md` — the slash command that fires the explicit self-audit.
- `skills/simplify/SKILL.md` — applies principle 2 to a finished diff.
- Adapted from Andrej Karpathy's writing on disciplined engineering.
