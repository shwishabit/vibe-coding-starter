---
name: simplify
description: Review changed code for unnecessary complexity, premature abstraction, dead code, and reinvention. Use after writing a feature and before committing, or any time the user says "simplify", "clean this up", "is this over-engineered", or "review what we just wrote".
---

# Simplify

Most beginner-stage code (and a lot of senior code) is more complicated than it needs to be. Run this after a working feature is in place and before you commit.

## When to fire

- After finishing a feature, before the commit.
- User says "simplify", "clean this up", "is this over-engineered", "review what we wrote", "shorter".
- A diff is >100 lines for what felt like a small change.
- You added a helper / abstraction / config option you're not sure you need.

## The five checks

Walk the diff. For each new function, file, abstraction, or config:

### 1. Can I delete this?

Most "helper" functions used in exactly one place are not helping. Inline them. A 10-line function called from one site is two abstractions: the function and the call. Delete one.

### 2. Did I reinvent something the language / framework already does?

- Custom date math → `Intl.DateTimeFormat` / `date-fns`.
- Custom debounce → `setTimeout` + flag, or import.
- Manual array dedup → `[...new Set(arr)]`.
- Hand-rolled fetch wrapper → just `fetch`, or the framework's data layer.

Ask the AI: "Is there a standard way to do this in [framework]?" Often there is.

### 3. Am I building for hypothetical future requirements?

- Config options no one has asked for.
- Generic helpers that handle 5 cases when you only use 1.
- Plugin systems with one plugin.
- Feature flags for features that aren't shipping.

Three similar lines is better than a premature abstraction. Wait for the third real use case before generalizing.

### 4. Are there comments explaining WHAT instead of WHY?

```js
// increment counter      ← delete
counter++;

// retry on 429 because vendor's rate limit resets per-minute, not per-request  ← keep
```

If the comment restates the code, delete it. Keep only comments that explain a non-obvious *why*.

### 5. Is there dead code?

- Imports that aren't used.
- Functions that aren't called.
- State / props passed through but never read.
- `// removed` or `// old version` placeholders.

Delete. Git remembers.

## Output format

After the walk, summarise:

```
Suggested simplifications:
1. <file>:<line> — <one line on what to change>
2. ...

Proposed deletions:
- <file>:<line> — <what and why>
```

Then ask: "Want me to apply these?" — don't apply without permission.

## When NOT to use

- Mid-implementation, before the feature works. Simplify after correctness, not before.
- On code you don't understand yet. Read first.
- When the user explicitly asked for a specific abstraction.

## References

- `skills/explain-plan-before-coding/SKILL.md` — the input-side discipline that prevents over-building in the first place.
