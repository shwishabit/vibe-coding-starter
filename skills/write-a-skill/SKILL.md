---
name: write-a-skill
description: Author a new skill (SKILL.md in skills/<name>/) for this workspace. Use when the user says "let's build a skill", "codify this", "add a skill for X", or when a pattern has repeated 3+ times and is worth saving as a reusable workflow.
---

# Write a Skill

Meta-skill for authoring new skills. A skill is a reusable workflow your AI invokes when it sees the trigger. Build one when the same pattern shows up 3+ times.

## When to fire

- User asks to build / write / add a new skill.
- A pattern has repeated 3 times — codify before the 4th.
- A workflow needs to be repeatable across projects.

## Anatomy

```
skills/<skill-slug>/
└── SKILL.md         # required — frontmatter + body
```

Optional, for bigger skills:

```
skills/<skill-slug>/
├── SKILL.md
├── references/      # deeper docs loaded on demand
└── assets/          # templates, starter files
```

## Frontmatter

```yaml
---
name: <skill-slug>
description: <ONE sentence — what it does>. Use when <specific triggers — user phrases, contexts, file types>.
---
```

Rules:

- **Max ~500 chars.** This is the only thing the AI sees when matching to user intent.
- **Third person.** "Reviews changed code…" not "I review…"
- **Two parts:** what it does + "Use when [specific triggers]".
- **Trigger language is keyword-rich.** Include the phrases users actually say.

## Body structure

```markdown
# <Skill Name>

<One paragraph: what this codifies, why it exists.>

## When to fire

<Bulleted explicit triggers.>

## <Core workflow / steps>

<Numbered steps, checklists, tables — whatever the work demands.>

## When NOT to use

<Negative triggers. Prevents misfiring on adjacent-but-wrong tasks.>

## References

<Other skills, memory files, external sources.>
```

## Decision tree — skill vs. memory vs. CLAUDE.md rule

| Pattern shape | Right home |
|---|---|
| Multi-step workflow with inputs/outputs | **Skill** |
| Single rule / always-do-X preference | **Memory** (`memory/feedback_*.md`) |
| Rule the AI should follow on every conversation | **CLAUDE.md** |

If unsure: skills are for *workflows*. Memory is for *rules*. CLAUDE.md is for *every-conversation defaults*.

## After authoring

1. Save the file at `skills/<slug>/SKILL.md`.
2. Open a fresh AI conversation and test it on a real task that matches the trigger.
3. If the AI doesn't invoke the skill when it should, sharpen the `description` triggers and try again.

## When NOT to use

- One-shot work you'll never repeat — just do it inline.
- A single rule that fits in one sentence — that's a memory entry, not a skill.
- Body would be <30 lines — usually belongs in memory as feedback instead.

## References

- `skills/setup-workspace/SKILL.md` — first skill that fires on a fresh clone.
- `CLAUDE.md` — workspace-level rules that fire every conversation.
