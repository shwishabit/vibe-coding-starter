---
description: Summarize current state as a paste-ready handoff block for a new conversation
---

Produce a compact, paste-ready handoff summary per `skills/fresh-chat/SKILL.md`. The user will paste this into a fresh conversation to continue from where this one left off.

**Output exactly this format:**

```
=== HANDOFF — <YYYY-MM-DD HH:MM> ===
Goal:         <one line — what we're trying to do at the project level>
Where we are: <one line — current state in the work>
Last thing:   <one line — last thing that worked OR last thing that broke>
Next step:    <one line — the immediate next concrete action>
Files:        <comma-separated list of files mid-edit, or "none">
Notes:        <one or two lines on anything non-obvious — only if needed>
```

**Hard rules:**

- Under 200 words.
- No commentary before or after the block.
- Use concrete file paths, exact filenames, exact error messages where relevant.
- If "Notes" is empty, omit the line entirely — don't pad.
