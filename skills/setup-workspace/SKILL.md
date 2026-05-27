---
name: setup-workspace
description: One-time personalization Q&A that runs on a fresh clone of vibe-coding-starter. Use when the user says "help me set up my workspace", "set up the workspace", "run setup", "first time setup", or invokes it on initial conversation in this repo.
---

# Setup Workspace

First-run skill. Runs a short Q&A, writes the user's answers to `memory/user_role.md`, optionally adds design skills, and points them to the project-ideation menu.

## When to fire

- User says "help me set up my workspace", "set up the workspace", "run setup", "first time setup", "initialize".
- Detect: `memory/user_role.md` still contains the stub placeholders (e.g. "_your name_").

## When NOT to fire

- `memory/user_role.md` is already filled in. Don't overwrite without explicit consent.
- The user just wants to skip ahead and code something — let them. Offer setup as optional ("want me to personalize this first, or jump in?").

## The Q&A — ask ONE at a time

Wait for each answer before the next question. Don't dump all four at once.

### Q1 — Identity + goal

> What's your name, what are you studying or working on, and what's the first thing you want to build?

### Q2 — Project type

> Pick the closest match — I'll tailor the rest of the setup:
>
> 1. **Website** for yourself or a side project
> 2. **Web app** with login and a database
> 3. **Game**
> 4. **Scratch-your-own-itch** tool you'll actually use
> 5. **LLM wrapper** — an app that calls an AI in the middle
> 6. **Discord bot**
> 7. **Browser extension**
> 8. Not sure yet — surprise me

### Q3 — Design / brand skills?

> Want me to add design + branding skills (color systems, typography, image generation prompts, accessibility audits)? Useful if you're building anything user-facing.
>
> **yes** / **no** / **later**

If yes: drop scaffolding stubs at `skills/design-direction/`, `skills/og-image/`, `skills/findability/` — minimal SKILL.md files the user can flesh out. Or point them to OPTIONAL-SKILLS.md to pick.

### Q4 — Docs lookup MCP?

> Want me to set up `context7` — a tool that fetches up-to-date library documentation? Recommended. The free tier covers what you'll need.
>
> **yes** / **no**

If yes: print the install command for their AI tool (Cline vs Claude Code differ — ask which they're using if not already clear) and link to TROUBLESHOOTING.md if it fails.

## After the Q&A

1. **Write `memory/user_role.md`** with the answers (replace the entire stub file). Frontmatter stays; body becomes:
   ```markdown
   **Name:** <answer>
   **Background:** <answer>
   **Goal:** <answer>
   **Project type:** <answer>
   **Design skills enabled:** <yes/no>
   **Docs MCP enabled:** <yes/no>
   ```

2. **One-line confirmation** of what was set up.

3. **Point to the ideation menu:**
   > Next: pick a project from [chrishornak.com/learn/vibe-coding/#pick-a-project](https://chrishornak.com/learn/vibe-coding/#pick-a-project), or tell me what you want to build and we'll grill the idea before writing code.

## Anti-patterns

- Asking all four questions in one message.
- Skipping the write to `memory/user_role.md` — that's the whole point.
- Auto-installing MCP / skills without asking.
- Pretending you set something up that you didn't.

## References

- `memory/user_role.md` — the file this skill populates.
- `OPTIONAL-SKILLS.md` — menu of extras the user can opt into.
- `TROUBLESHOOTING.md` — fixes for Q4 install failures.
