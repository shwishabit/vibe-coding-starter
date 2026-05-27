# Workspace rules

> Your AI loads this file on every conversation. Five rules. Keep them.

## 1. No filler openers

Never start a response with "Great!", "Sure!", "Absolutely!", "Of course!", "Perfect!", or "Nice." Lead with the action or answer.

## 2. Verification before completion is a GATE

Before claiming anything is "done", "fixed", "shipped", or "passing": run the actual verification command in this turn and read the output. "Should work" is not evidence. See `skills/verification-before-completion/SKILL.md`.

## 3. When in doubt, /grill-me before writing code

If the request is ambiguous, the edge cases aren't clear, or the user keeps refining what they want — stop and run `/grill-me` (interview, one question at a time) before writing any code.

## 4. Skills-first

This repo ships skills in `skills/` and slash commands in `commands/`. When a task matches a skill's trigger, invoke the skill instead of hand-rolling. Don't reinvent. See `skills/write-a-skill/SKILL.md` if you need to add a new one.

## 5. Approval gates for destructive or expensive actions

Always ask the user before: pushing to a remote git, deploying to production, deleting files the user authored, installing paid packages or services, sending email/messages from their account. The cost of asking once is low. The cost of a wrong destructive action is high.

---

## Working defaults

- **Run it yourself.** When a task needs a command run (`npm run build`, `git status`, `tsc`), the AI runs it via the terminal tool and reads the output. Don't punt commands to the user and ask them to paste output.
- **Spiral detection.** If the same file is about to be edited a 3rd time in one session without a clear "this is working" milestone, pause and offer `/reset`. Two attempts means we're still solving; a third means the plan is wrong.
- **Karpathy filter.** Before any non-trivial code: think first, simplest move that works, surgical (don't refactor adjacent code), goal-driven (know the success criterion). Full version: `skills/karpathy-protocol/SKILL.md`.

---

## Slash commands

- `/grill-me` — interview before code, one question at a time
- `/karpathy` — self-audit against the four principles above
- `/caveman` — toggle ultra-compressed responses (useful on free-tier rate limits)
- `/fresh` — produce a handoff summary for starting a new conversation
- `/status` — 2-sentence breadcrumb of where we are
- `/log <text>` — quick-save a lesson to `memory/LESSONS.md`
- `/reset` — circuit breaker for edit spirals (3 options, no auto-destroy)

## Skills (auto-invoked on matching triggers)

`verification-before-completion` · `diagnose` · `simplify` · `karpathy-protocol` · `caveman` · `fresh-chat` · `explain-plan-before-coding` · `read-the-error-carefully` · `small-commits` · `secret-scan` · `explain-this-code` · `what-did-i-learn` · `setup-workspace` · `write-a-skill`

## Memory

Long-term facts, preferences, and lessons live in `memory/`. The index is `MEMORY.md`. Read it when context suggests something might already be remembered. Write to it when the user teaches you something worth keeping.
