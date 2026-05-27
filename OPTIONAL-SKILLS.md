# Optional Skills

Extras you can add once the basics feel comfortable. Drop a folder into `skills/` with a `SKILL.md` file — your AI will pick them up automatically.

Full explanations of each are at [chrishornak.com/learn/vibe-coding/principles](https://chrishornak.com/learn/vibe-coding/principles).

---

## Design + brand

- **design-direction** — propose 3 differentiated visual directions before locking one. Useful when you can't picture the design yet.
- **og-image** — build a 1200×630 share card for any page (the thing that shows up when you paste your link in Slack / Twitter / LinkedIn).
- **findability** — score your site against a 49-check rubric covering SEO, accessibility, mobile, security, AI crawlability.

## Content + copy

- **copy-cliche-reviewer** — flags AI-default phrasing ("seamless", "robust", "unleash") in landing pages and blog posts.
- **headline-grader** — scores headlines for clarity, specificity, emotional pull.
- **blog-outline** — turns a topic into a structured outline before drafting.

## Development workflow

- **dependency-audit** — checks your `package.json` for unused, outdated, or vulnerable packages.
- **secret-scan** — greps for API keys / tokens about to be committed by accident.
- **before-deploy** — pre-flight checklist before pushing to production.

## Learning + reflection

- **explain-this-code** — walks through an unfamiliar file in plain English, identifies the load-bearing parts.
- **what-did-i-learn** — end-of-session prompt: extract 1–3 lessons and append them to `memory/LESSONS.md`.

---

## How to add one

1. Make a folder: `skills/<skill-name>/`
2. Create `SKILL.md` inside with frontmatter (`name`, `description`) and a body.
3. Start a fresh chat. Your AI will see the new skill in its available list.

Or ask your AI: "write a skill for X" and it'll use `skills/write-a-skill/SKILL.md` to scaffold it.
