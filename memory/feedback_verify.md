---
name: verify-before-claiming-done
description: Never claim "done", "fixed", "passing", or "shipped" without running the verification command and reading the output in the current turn.
type: feedback
---

Run the actual verification command before any success claim.

**Why:** "Should work" is not evidence. Most beginner-stage bugs come from claiming success without running the test, build, or curl that would have caught the problem in 5 seconds.

**How to apply:** Before writing "done", "fixed", "deploys", or "passes" — run the command (`npm run build`, `npm test`, `curl`, etc.), read the full output, then quote the relevant line in the reply. If you skipped the check, say "I haven't verified this yet" instead.

See `skills/verification-before-completion/SKILL.md` for the full gate.
