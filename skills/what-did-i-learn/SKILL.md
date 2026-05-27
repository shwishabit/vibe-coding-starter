---
name: what-did-i-learn
description: End-of-session reflection — extract 1-3 lessons from the conversation and append to memory/LESSONS.md so the AI improves over time. Use when the user says "end session", "wrap up", "we're done", "what did we learn", or invokes /log without specifying text.
---

# What Did I Learn

A short reflection at the end of a working session. Pulls the durable lessons out of the conversation so the AI's memory grows automatically — not just when the user thinks to type `/log`.

## When to fire

- "End session" / "we're done for the day" / "wrap up" / "let's stop."
- `/log` invoked with no argument (interpret as "decide what to log").
- After a major milestone shipped (a deploy, a feature done, a bug crushed).
- After a `/reset` — the spiral itself usually contains a lesson.

## What counts as a lesson

Save things that change *future* behavior. Skip anything obvious or already documented.

| Save | Skip |
|---|---|
| "User prefers TypeScript strict mode always — added without asking next time." | "We fixed a typo in line 12." |
| "When deploying to Vercel, env vars need to be added in dashboard, not just `.env.local`." | "We ran `npm run build`." |
| "User pushes back on dependency installs — always ask before adding a new package." | "User wanted the button to be blue." |
| "The Notion API requires a 2025-08-26 version header, otherwise 401s." | "We made progress today." |

If you can't think of any lessons that would change future behavior — say so. Don't pad.

## The format

Read `memory/LESSONS.md` first (create if missing with `# Lessons` heading). Append:

```
- [LESSON] YYYY-MM-DD HH:MM · <one-line lesson, durable, behavior-changing>
```

One bullet per lesson. Maximum 3 per session.

## How to present

Show the lessons you're about to save, in this format:

```
Three lessons from this session:

1. <lesson 1>
2. <lesson 2>
3. <lesson 3>

Append to memory/LESSONS.md? (y/n)
```

If the user says yes (or "save them"), append and confirm with `✓ saved N lessons.`
If the user edits the list, save the edited version.
If the user says skip — don't save, just say `noted, nothing saved.`

## When NOT to use

- Short sessions (< 5 turns) — usually nothing worth saving.
- Sessions that were mostly the user reading / asking questions — no behavioral lessons.
- The user is mid-task and just asked for a status check — that's `/status`, not this.

## References

- `commands/log.md` — manual single-line save (verbatim, no review).
- `memory/LESSONS.md` — the destination file.
