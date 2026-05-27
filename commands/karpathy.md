---
description: Run the Karpathy filter as a self-audit on the current conversation or proposed change
---

Run the Karpathy filter as an explicit self-audit per `skills/karpathy-protocol/SKILL.md`. Walk the four principles in order and report — one short paragraph each — what is clean and what is at risk.

**1. Think before coding** — did I state assumptions? Are there multiple readings I haven't surfaced? Anything unclear I haven't asked about?

**2. Simplicity first** — am I writing more than the minimum? Speculative code, unrequested flexibility, abstractions for single-use logic?

**3. Surgical changes** — does every changed line trace back to the user's request? Am I touching files that aren't strictly necessary? "Improving" adjacent code?

**4. Goal-driven execution** — is there a verifiable success criterion? For multi-step work, is the plan stated with verify steps per item?

**Output:**
- One short paragraph per principle.
- If any principle is at risk, propose the minimal correction (not a rewrite).
- If all four are clean, say so and proceed with the original task.

Do not perform any other work in this response. The only job is the audit.
