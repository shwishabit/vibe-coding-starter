---
name: fresh-chat
description: Suggest starting a new conversation when context is bloating or the user is shifting acts. Use proactively when the session has run long, when shifting from "designing" to "building" (or any major act change), or when invoked via /fresh.
---

# Fresh Chat

Long conversations get slower, more expensive, and more confused. AIs work better with a clean slate when you switch what you're doing.

## When to nudge (one short line, non-blocking)

- **Session is long.** Roughly 50+ turns, or the user has been at it 2+ hours.
- **Act shift.** User pivots from one mode to another — designing → building, building → debugging, debugging → shipping. Each act has different context needs.
- **After `/reset`.** A reset means the prior thread didn't work. New chat is the natural next move.
- **Context warnings.** If the AI tool surfaces a context-usage indicator, watch it.

## How to nudge

One sentence. No pressure. Example:

> We've been at this a while and you just shifted from designing to building — worth a fresh chat? Type `/fresh` and I'll summarize the state for you to paste in.

Then continue with the user's actual request. Don't gate on the answer.

## On `/fresh` — the handoff summary

When invoked, output a compact paste-ready summary:

```
=== HANDOFF — <YYYY-MM-DD HH:MM> ===
Goal:        <one line — what we're trying to do>
Where we are: <one line — current state>
Last thing:   <one line — last thing that worked or last thing that broke>
Next step:    <one line — the immediate next action>
Files:        <list any files mid-edit>
Notes:        <one or two lines on anything non-obvious — only if needed>
```

Keep it under 200 words. The user pastes this into a new conversation; the new chat picks up from there.

## Why this matters

Every message you send includes the entire conversation history. The bigger the history, the slower the response, the more tokens you burn (free tier hits limits faster), and the more likely the AI loses the thread on important details from earlier.

Fresh chats are not a failure mode — they're the way to keep momentum.

## When NOT to nudge

- Mid-task within a single act (don't interrupt a working build).
- User explicitly said "stay in this thread."
- The conversation is short and focused.

## References

- `commands/fresh.md` — the slash command that produces the handoff summary.
- `commands/reset.md` — circuit breaker for edit spirals; often followed by `/fresh`.
