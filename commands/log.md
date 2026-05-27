---
description: Quick-save a lesson to memory/LESSONS.md (verbatim, timestamped)
argument-hint: <text to log>
---

Append the user's text **verbatim** to `memory/LESSONS.md`.

**Steps:**

1. If `memory/LESSONS.md` doesn't exist, create it with a `# Lessons` heading.
2. Append a new bullet at the end using this exact format:
   ```
   - [LESSON] YYYY-MM-DD HH:MM · <user's text>
   ```
3. Reply with **single line only**: `✓ logged.`

The user's text to log:
$ARGUMENTS

**Hard rules:**

- Do NOT interpret, expand, summarize, or rephrase the text. Save verbatim.
- Do NOT add commentary, follow-up questions, or analysis.
- `✓ logged.` is the entire reply. Nothing else.
