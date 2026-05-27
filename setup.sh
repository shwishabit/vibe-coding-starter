#!/usr/bin/env bash
# One-time setup for vibe-coding-starter.
# Safe to re-run — idempotent.

set -e

echo "→ vibe-coding-starter setup (macOS / Linux)"
echo

# 1. .gitignore sanity check
if [ ! -f .gitignore ]; then
  echo "  no .gitignore found — creating one"
  cat > .gitignore <<'EOF'
node_modules/
.env
.env.local
.DS_Store
dist/
build/
.next/
*.log
EOF
else
  echo "  ✓ .gitignore present"
fi

# 2. MCP config hint (we don't auto-install — your AI does that on Q4 of setup-workspace)
echo
echo "  MCP config (when you opt into context7 in setup-workspace):"
echo "    Claude Code: ~/.claude/mcp.json"
echo "    Cline:       .vscode/cline_mcp_settings.json  (or via the Cline UI)"
echo

# 3. Friendly nudge
echo "✓ Setup done."
echo
echo "Next: open this folder in your editor and tell your AI:"
echo "  help me set up my workspace"
echo
