# One-time setup for vibe-coding-starter (Windows / PowerShell).
# Safe to re-run — idempotent.

$ErrorActionPreference = "Stop"

Write-Host "→ vibe-coding-starter setup (Windows)"
Write-Host ""

# 1. .gitignore sanity check
if (-Not (Test-Path ".gitignore")) {
    Write-Host "  no .gitignore found — creating one"
    @"
node_modules/
.env
.env.local
.DS_Store
dist/
build/
.next/
*.log
"@ | Out-File -FilePath ".gitignore" -Encoding utf8
} else {
    Write-Host "  ✓ .gitignore present"
}

# 2. MCP config hint
Write-Host ""
Write-Host "  MCP config (when you opt into context7 in setup-workspace):"
Write-Host "    Claude Code: $env:USERPROFILE\.claude\mcp.json"
Write-Host "    Cline:       .vscode\cline_mcp_settings.json  (or via the Cline UI)"
Write-Host ""

# 3. Friendly nudge
Write-Host "✓ Setup done."
Write-Host ""
Write-Host "Next: open this folder in your editor and tell your AI:"
Write-Host "  help me set up my workspace"
Write-Host ""
