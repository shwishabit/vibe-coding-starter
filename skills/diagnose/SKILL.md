---
name: diagnose
description: Disciplined diagnosis loop for hard bugs and performance regressions — reproduce → minimise → hypothesise → instrument → fix → regression-test. Use when something is broken, throwing errors, failing, or behaving wrong, and the cause isn't obvious from one read.
---

# Diagnose

A disciplined seven-phase loop for hard bugs. Enforces Phase 1 (build a feedback loop) before any hypothesizing. Most lost debugging hours come from skipping Phase 1.

## When to fire

- "X is broken", "Y is throwing", "it's failing", "diagnose this", "debug this"
- A perf regression — something used to be fast and isn't.
- A test was passing and now isn't.
- An intermittent / "sometimes" bug.

## When NOT to use

- The fix is obvious from the error message + 30 seconds of code reading (typo, missing import).
- Pure feature work — that's building, not diagnosing.
- "How does X work" questions — that's exploration.

## Phase 1 — Build a feedback loop

**Do not skip this.** Before any hypothesis, get to a place where you can trigger the bug on demand in under 10 seconds. Options, cheapest first:

1. **Existing test.** Run it. If it reproduces, you have a loop.
2. **New failing test.** Write one that exercises the bug with one function call.
3. **Curl / fetch loop.** For HTTP issues, a single curl that reliably fails.
4. **Manual script.** A `repro.ts` or `repro.sh` that triggers it.
5. **Fuzz / repeat loop.** For "sometimes" bugs: run 100× and count failures.

A 2-second deterministic loop is a debugging superpower. A 30-second flaky loop is barely better than no loop.

## Phase 2 — Reproduce

Run the loop. Watch the bug happen. Confirm it's the bug the user described — not a different failure that happens to be nearby.

## Phase 3 — Minimise

Strip the repro down. Remove unrelated code, fixtures, env vars one at a time. Re-run after each removal. Stop when removing the next thing makes the bug disappear — you've found the load-bearing component.

## Phase 4 — Hypothesise

Now (and not earlier) form hypotheses. For each:

- One sentence: "I think X is wrong because Y."
- An experiment: what would the loop output if this is correct?
- A prediction: what would falsify it?

Rank by which is fastest to falsify. **Falsify cheapest first.**

## Phase 5 — Instrument

Where the hypothesis points, add temporary logging / assertions. Re-run the loop. Read the signal.

## Phase 6 — Fix

Smallest fix that satisfies the loop's pass condition. Resist refactoring surrounding code unless the root cause demands it.

## Phase 7 — Regression-test

Before declaring done:

- [ ] Loop passes (the bug is fixed).
- [ ] Loop is preserved as a test if it makes sense — so the bug can't silently return.
- [ ] No collateral damage — existing tests, type check, lint all still pass.

Then trigger `skills/verification-before-completion/SKILL.md` before any "fixed!" claim.

## Anti-patterns

- **Hypothesising before a loop.** Recipe for wasted hours.
- **"Looks like X to me, fixing X."** Read-only inspection isn't diagnosis.
- **Adding logging without a hypothesis.** Logs without a prediction = noise.
- **Fixing a different bug.** Always confirm Phase 2 reproduces the *reported* failure.

## References

- `skills/verification-before-completion/SKILL.md` — gates the "fixed!" claim at the end.
- Adapted from `mattpocock/skills`.
