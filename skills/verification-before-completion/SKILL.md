---
name: verification-before-completion
description: Use before claiming any work is complete, fixed, deployed, or passing — and before any commit, push, PR, or end-of-turn summary. Requires running the actual verification command and reading its output in THIS turn before any success claim. Evidence before assertions, always.
---

# Verification Before Completion

Claiming work is complete without verification is dishonesty, not efficiency. This skill is the gate that prevents both "should work now" and "the AI said it shipped — let's see" disasters.

**Core principle:** Evidence before claims, always.

## The Iron Law

```
NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE
```

If you haven't run the verification command in *this message*, you cannot claim it passes. Output from earlier in the session doesn't count — code has changed since.

## The Gate

Before any of these phrases leave your mouth:

- "shipped", "fixed", "done", "passes", "deploys", "working"
- "should work now", "should be good", "probably fixed"
- "Great!", "Perfect!", "Nice." (filler openers implying success)

Run this gate:

1. **IDENTIFY** — what command proves this claim?

   | Claim | Command |
   |---|---|
   | "Build passes" | `npm run build` exits 0 |
   | "TypeScript clean" | `tsc --noEmit` exits 0 |
   | "Dev server up" | `curl -sI http://localhost:3000` returns 200, OR read the dev log and confirm "✓ Ready" appears |
   | "Tests pass" | `npm test` exits 0, full output read |
   | "Deploy succeeded" | Hosting provider's build log shows "Deployment ready" |
   | "Migration applied" | Re-query the schema and confirm the new column exists |
   | "Form submits" | Submit a test entry, confirm it landed |

2. **RUN** — execute the full command. Not a partial check. Not a paraphrase.
3. **READ** — full output. Check the exit code. Don't skim.
4. **VERIFY** — does the output confirm the claim?
   - **No:** state the actual status with evidence. Don't soften it.
   - **Yes:** state the claim WITH the evidence (one line — `npm run build → exit 0`).
5. **ONLY THEN** make the claim.

Skipping any step is lying, not verifying.

## Red flags — STOP

These phrases mean you haven't verified:

- "should work", "probably fixed", "seems to", "I think it's"
- About to commit / push / open a PR without running the build
- Trusting an agent's success report without checking the diff
- "Just this once" — no exceptions
- "I'm confident" — confidence is not evidence

## Rationalization prevention

| Excuse | Reality |
|---|---|
| "Should work now" | RUN the command |
| "I'm confident" | Confidence ≠ evidence |
| "TypeScript passed" | tsc ≠ runtime; still run dev/build |
| "Linter passed" | Linter ≠ compiler ≠ runtime |
| "Partial check is enough" | Partial proves nothing |
| "Just this once" | "Just this once" is how every bad incident report starts |

## Deploy checks (before pushing to production)

A deploy is a verification claim with bigger blast radius. Before any `git push` to a branch that auto-deploys, OR before clicking "Deploy" anywhere:

1. **Build locally.** `npm run build` (or your equivalent) → exit 0. Read the output. Production builds catch things dev mode hides — unused imports, type errors marked as warnings in dev, env vars that aren't defined.
2. **Run the secret scan.** If `skills/secret-scan/SKILL.md` exists, fire it on the staged diff. A leaked key in a public push lives forever in git history.
3. **Check `.env` discipline.** Are env vars referenced in code also set on the production host (Vercel dashboard, etc.)? `.env.local` doesn't ship.
4. **Smoke-test the change.** Open the page you changed in dev. Click the thing. Confirm it works.
5. **Then push.** And after the hosting platform reports "deploy ready," curl the live URL or open it in a browser to confirm.

## When NOT to use

- Pure exploration / reading code — no claim being made.
- Asking "how does X work" — that's a question, not a completion claim.
- Mid-implementation status updates that explicitly say "not done yet."

## References

- `commands/grill-me.md` — the input-side gate. This is the output-side gate.
- Adapted from `obra/superpowers`.
