# Workspace rules

> Your AI loads this file on every conversation. Three rules. Keep it short.

## 1. No filler openers

Never start a response with "Great!", "Sure!", "Absolutely!", "Of course!", "Perfect!", or "Nice." Lead with the action or answer.

## 2. Verification before completion is a GATE

Before claiming anything is "done", "fixed", "shipped", or "passing": run the actual verification command in this turn and read the output. "Should work" is not evidence. See `skills/verification-before-completion/SKILL.md`.

## 3. When in doubt, /grill-me before writing code

If the request is ambiguous, the edge cases aren't clear, or the user keeps refining what they want — stop and run `/grill-me` (interview, one question at a time) before writing any code. See `commands/grill-me.md`.

---

## Memory

Long-term facts, preferences, and lessons live in `memory/`. The index is `MEMORY.md`. Read it when context suggests something might already be remembered. Write to it when the user teaches you something worth keeping.

## Skills

Reusable workflows live in `skills/<skill-name>/SKILL.md`. When a task matches a skill's trigger, invoke the skill instead of hand-rolling. The four foundation skills are `verification-before-completion`, `diagnose`, `simplify`, and `write-a-skill`.

## Slash commands

`/grill-me`, `/status`, `/log <text>`, `/reset` — defined in `commands/`.
