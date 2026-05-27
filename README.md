# Vibe Coding Starter

A clone-and-go workspace for learning to code with an AI agent. Built by [Chris Hornak](https://chrishornak.com) — opinionated defaults, no clutter.

Works with two tracks:

- **Free Starter** — VSCode + [Cline](https://cline.bot) extension + free Google Gemini API key. $0.
- **Recommended** — VSCodium (or VSCode) + [Claude Code](https://docs.claude.com/claude-code) + Claude Pro. ~$20/mo.

Same repo. Same paradigm. Different model power.

---

## Quickstart

1. **Clone this repo.**
   ```bash
   git clone https://github.com/shwishabit/vibe-coding-starter.git my-project
   cd my-project
   rm -rf .git && git init
   ```

2. **Install one of the two AI tracks** (see the full walkthrough at [chrishornak.com/learn/vibe-coding](https://chrishornak.com/learn/vibe-coding)).

3. **Run setup once** — this wires the MCP config and `.gitignore` to your OS.
   - macOS / Linux: `bash setup.sh`
   - Windows: `powershell -ExecutionPolicy Bypass -File setup.ps1`

4. **Open the folder in your editor and start a chat with your AI.** First message:
   ```
   help me set up my workspace
   ```
   The `setup-workspace` skill will run a short Q&A and personalize your `memory/user_role.md`.

5. **Then pick your first project** from the menu at [chrishornak.com/learn/vibe-coding/#pick-a-project](https://chrishornak.com/learn/vibe-coding/#pick-a-project).

---

## What's in here

```
CLAUDE.md          — short rules your AI loads on every conversation
MEMORY.md          — index of long-term memory files
memory/            — personal facts, preferences, lessons (you grow this over time)
skills/            — reusable workflows your AI knows how to invoke
commands/          — slash commands you can type (/grill-me, /status, /log, /reset)
OPTIONAL-SKILLS.md — menu of extras you can add later
TROUBLESHOOTING.md — fixes for common day-one issues
```

---

## Two principles to read first

Before you type your first prompt, read these:

- **[Grill before you code](https://chrishornak.com/learn/vibe-coding/principles#grill-before-you-code)** — 20 minutes of questions saves 4 hours of debugging.
- **[Verify before you ship](https://chrishornak.com/learn/vibe-coding/principles#verify-before-you-ship)** — "should work" is not evidence. Run the command, read the output.

The other 8 principles are at [chrishornak.com/learn/vibe-coding/principles](https://chrishornak.com/learn/vibe-coding/principles).

---

## License

MIT. Use it, fork it, ship things.
