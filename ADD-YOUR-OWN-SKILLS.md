# Add Your Own Skills

The starter ships with 14 skills — enough to ship most first projects. As you learn what you actually want, add more.

A skill is just a folder in `skills/` with a `SKILL.md` file inside. The AI auto-discovers them.

## The fastest way

Tell your AI:

> Write a new skill that [does X]. Use `skills/write-a-skill/SKILL.md` for the format.

It'll scaffold the file in the right shape with the right frontmatter. You confirm, edit, save.

## What makes a good skill

- **Repeatable.** You'd want this same thing done the same way 3+ times.
- **Multi-step.** If it's a single rule, save it as a memory file (`memory/feedback_*.md`) instead.
- **Has a clear trigger.** The `description` field has to tell the AI *when* to fire — "Use when [user says X] or [condition Y]."

## Examples of skills people add

- `commit-message-style` — enforce the format you like for your project.
- `before-deploy-mine` — the specific pre-deploy checks for your stack.
- `weekly-review` — a Monday-morning skill that reviews `memory/LESSONS.md` and surfaces patterns.
- `explain-this-error` — your project's error patterns + their fixes.

You'll know what to add when the same request comes up a third time and you wish the AI had remembered.
