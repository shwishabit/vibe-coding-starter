---
description: Circuit Breaker — exit an edit spiral (3 options, no auto-destroy)
---

Enter Reset Mode. **Stop the current edit thread immediately.** No further file writes until the user picks an option.

## Step 1 — Report the spiral state

Identify the file(s) edited repeatedly in this session. Report exactly:

> We've touched `<file(s)>` N times in this spiral. Last clean checkpoint = `<git HEAD <hash>>` or `<the last working state we agreed on>`.

If multiple files are in the spiral, list each with its edit count.

## Step 2 — Offer 3 options (no destructive default)

1. **Revert (git)** — discard spiral changes via `git checkout <file>` or `git stash push <file>`. Requires explicit approval. Only viable for tracked files.
2. **Keep + Grill** — preserve changes, switch immediately to `/grill-me` to re-lock the plan before any further edits.
3. **Continue** — accept current state as the new stable point, re-affirm the goal aloud in one sentence, and continue.

## Step 3 — Wait for the user's pick

- Do **NOT** execute any destructive action without an explicit pick.
- Do **NOT** default to any option silently.
- If the next message doesn't pick, stay in Reset Mode and re-prompt.

## Step 4 — On pick, execute and reset the spiral counter

- Option 1: confirm the git command in chat, request approval, then execute.
- Option 2: launch `/grill-me` mode immediately. First question: "What's the actual goal we're trying to hit on `<file>`?"
- Option 3: state the re-affirmed goal, then continue.
