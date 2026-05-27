---
name: secret-scan
description: Pattern-match for API keys, tokens, passwords, and other secrets in staged or about-to-be-committed code. Use before any commit, before pushing to a public repo, and whenever the user pastes config or a .env file into chat.
---

# Secret Scan

A 30-second check before a commit. Catches the most common credential leaks before they hit your git history.

## When to fire

- Right before `git commit` or `git push` — especially the first push to a public repo.
- User pastes a config file, `.env`, or anything that "looks like setup."
- User asks: "is it safe to commit this?" / "did I leak anything?"

## What to look for

Scan staged files (or whatever the user just pasted) for these patterns:

| Pattern | Example | What it is |
|---|---|---|
| `sk-[A-Za-z0-9]{20,}` | `sk-proj-abc123...` | OpenAI / Anthropic key |
| `AIza[A-Za-z0-9_-]{35}` | `AIzaSyAbc...` | Google / Gemini API key |
| `ghp_[A-Za-z0-9]{36}` | `ghp_xyz...` | GitHub personal access token |
| `xox[bps]-[A-Za-z0-9-]+` | `xoxb-...` | Slack token |
| `eyJ[A-Za-z0-9_-]+\.eyJ[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+` | `eyJhbG...` | JWT |
| `-----BEGIN (RSA |OPENSSH |EC )?PRIVATE KEY-----` | | Private key |
| `aws_secret_access_key` / `aws_access_key_id` | | AWS credentials |
| `password\s*[:=]\s*['"][^'"]{4,}` | `password: "actual-password"` | Hardcoded password |

Also flag: any string ≥ 32 chars of mixed alphanumeric in a value position that looks key-shaped.

## What to do when a secret is found

1. **STOP — do not commit.**
2. Quote the file + line where the secret appears.
3. Tell the user the type of secret it appears to be.
4. Recommend: (a) move it to `.env.local` (already gitignored in the starter); (b) reference it via `process.env.X` in code; (c) **rotate the key immediately** if it's been pasted in chat or written to a tracked file.
5. Only after the secret is removed, re-scan and confirm clean.

## When NOT to use

- Reading docs, examples, or test fixtures with obviously-fake placeholder keys (`sk-XXXXX`, `your-api-key-here`).
- Inside a `.env.example` file with placeholder values — that's the intended pattern.

## References

- `.gitignore` — the starter ignores `.env*` files by default.
- `skills/verification-before-completion/SKILL.md` — the broader pre-commit/push gate.
