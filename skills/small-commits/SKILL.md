---
name: small-commits
description: After each working change, suggest a commit with a clear message before moving on to the next thing. Use whenever a feature, fix, or refactor reaches a working state and the next step is unrelated.
---

# Small Commits

Commit when something works, not when the whole project is done. A working repo with 50 small commits is recoverable. A broken repo with one giant commit is a weekend.

## When to fire

- A feature or fix just reached a working state (build passes, manual check works).
- About to start an unrelated change (different feature, different bug).
- About to refactor — commit the working state first so refactor is reversible.
- The user says "save this", "checkpoint", "lock this in".

## The flow

1. **Confirm it works.** Run the verification (`skills/verification-before-completion/SKILL.md`). Quote the evidence.
2. **Summarise the change in one sentence.** Past tense. Imperative is also fine. Examples:
   - "Add login form to /signup page"
   - "Fix off-by-one in pagination — last page was unreachable"
3. **Show the proposed commit command:**
   ```bash
   git add <files>
   git commit -m "<one-line message>"
   ```
4. **Ask: "Commit this?"** Wait for yes before running.

## Message style

- **One line, ≤72 chars.** If you need more, the commit is too big — split it.
- **What changed, not how.** "Fix login redirect loop" not "change useEffect dependency array".
- **Present tense, imperative.** "Add", "Fix", "Remove" — not "Added", "Fixed".
- **No emojis, no decorations.** The git log is read in monospaced terminals.

## Anti-patterns

- "WIP" / "stuff" / "updates" as the message. Useless six months from now.
- One commit with 47 files changed. Break it down.
- Committing without running the build first. See `skills/verification-before-completion/SKILL.md`.
- Auto-committing without asking. Always confirm.

## When NOT to use

- Mid-implementation, code doesn't run yet — don't commit broken code.
- The user said "don't commit, I want to see the diff first."
- This is a doc-only / experimental scratch session.

## References

- `skills/verification-before-completion/SKILL.md` — verify before commit.
