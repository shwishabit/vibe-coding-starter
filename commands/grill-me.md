---
description: Stress Test mode — interview before code (one question at a time, no writes)
---

Enter Grill Me Mode.

**STOP.** Do not write code. Do not edit files (read-only ok). Acknowledge entering Grill Me Mode in one line.

Interview the user **one question at a time** — wait for the answer before the next question. Cover in this order, skip a category only if genuinely N/A:

1. **Ambiguity** — what's underspecified or could mean multiple things.
2. **Edge cases** — empty / null / max / concurrent / offline failure modes.
3. **UX friction** — where will the user (or end-users) get stuck or confused.
4. **Data integrity** — what could corrupt state, leak data, or get out of sync.
5. **Naming** — what to call any new file / variable / component / table.

When the plan is locked:

1. Restate it as a short `[PLAN]` block:
   ```
   [PLAN]
   Goal: <one sentence>
   Approach: <one or two sentences>
   Files: <bullets>
   Out of scope: <bullets>
   ```
2. Ask explicit permission before writing any code.

**Anti-patterns:**

- Multi-question dumps ("A few questions: 1)... 2)... 3)...").
- "Should I do A, B, or C?" without giving a recommendation.
- Skipping to code after a single answered question.
- Treating Grill Me as a rubber-stamp gate — push back if an answer is hand-wavy.
