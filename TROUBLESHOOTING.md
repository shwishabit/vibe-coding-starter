# Troubleshooting

Common day-one issues, in order of frequency.

---

## Cline / Claude Code doesn't see my CLAUDE.md or skills

**Cause:** You opened the folder in the wrong place, or your AI is looking at a different working directory.

**Fix:**
- Make sure your editor's open folder is the root of this repo (the folder that *contains* `CLAUDE.md`, not a parent or subfolder).
- Start a fresh AI conversation after opening the right folder.
- In Claude Code: run `/status` and check the "cwd" line.
- In Cline: check the workspace path in the Cline panel header.

---

## My Gemini API key is rejected

**Cause:** Three common ones — wrong region, billing not enabled (even for free tier), or you pasted with a trailing space.

**Fix:**
1. Generate a fresh key at [aistudio.google.com](https://aistudio.google.com).
2. Copy carefully — no leading/trailing whitespace.
3. Paste into Cline's settings: AI Provider → Google Gemini → API Key.
4. If still rejected: confirm your Google account has Generative Language API enabled in [console.cloud.google.com](https://console.cloud.google.com).

---

## Claude Code says "Pro subscription required" but I have one

**Fix:**
- Sign out and back in: `claude logout` then `claude login`.
- Confirm the email on your Claude account matches the one you logged in with.

---

## MCP install fails ("command not found", "ENOENT")

**Cause:** Node isn't installed, or `npx` isn't on your PATH.

**Fix:**
1. Check Node: `node -v`. Should be ≥18.
2. If missing: install from [nodejs.org](https://nodejs.org) (LTS).
3. Restart your terminal AND your editor after installing.
4. Re-run the install command.

---

## The AI keeps asking the same question / doesn't remember things

**Cause:** Memory files aren't being read, or they're empty.

**Fix:**
- Check `memory/user_role.md` is filled in (not still the stub).
- Check `MEMORY.md` has entries pointing to the memory files.
- Start a fresh conversation — long sessions can lose track of files added mid-stream.

---

## Build / dev server won't start

**Fix:** Quote the exact error message back to your AI and ask it to diagnose. It has `skills/diagnose/SKILL.md` and `skills/read-the-error-carefully/SKILL.md` for exactly this.

If the error mentions a port in use:
- macOS / Linux: `lsof -i :3000` then `kill -9 <PID>`
- Windows (PowerShell): `Get-NetTCPConnection -LocalPort 3000` then `Stop-Process -Id <PID>`

---

## I broke something and the AI made it worse

Run `/reset`. Pick option 1 (revert via git). This is exactly what it's for.

If you didn't commit before the spiral: there's nothing to revert to. Lesson for next time — commit more often. See `skills/small-commits/SKILL.md`.
