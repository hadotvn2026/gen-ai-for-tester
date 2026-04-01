#!/bin/bash
# GenAI for Testers — Minimal Trainee Setup
# Run: bash setup.sh

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

ok()   { echo -e "${GREEN}✅  $1${NC}"; }
warn() { echo -e "${YELLOW}⚠️   $1${NC}"; }
fail() { echo -e "${RED}❌  $1${NC}"; exit 1; }
step() { echo -e "\n${YELLOW}▶ $1${NC}"; }

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   GenAI for Testers — Setup Script   ║"
echo "╚══════════════════════════════════════╝"
echo ""

# ── 1. Check prerequisites ────────────────────────────────────────────
step "Checking prerequisites..."

# Node.js
if command -v node &>/dev/null; then
  NODE_VER=$(node -v | sed 's/v//' | cut -d. -f1)
  if [ "$NODE_VER" -ge 18 ]; then
    ok "Node.js $(node -v)"
  else
    fail "Node.js 18+ required (found $(node -v)). Install from https://nodejs.org"
  fi
else
  fail "Node.js not found. Install from https://nodejs.org"
fi

# Git
if command -v git &>/dev/null; then
  ok "Git $(git --version | awk '{print $3}')"
else
  fail "Git not found. Install from https://git-scm.com"
fi

# VS Code (optional — warn only)
if command -v code &>/dev/null; then
  ok "VS Code CLI available"
else
  warn "VS Code 'code' command not found — open workspace/ manually in VS Code"
fi

# ── 2. Install Playwright ─────────────────────────────────────────────
step "Installing Playwright..."
cd "$(dirname "$0")/playwright-tests"
npm install --silent
ok "npm packages installed"

step "Installing Playwright browsers (Chromium only)..."
npx playwright install --with-deps chromium 2>&1 | tail -3
ok "Chromium browser ready"

# ── 3. Run smoke tests ────────────────────────────────────────────────
step "Running smoke tests..."
if npm test -- --reporter=line 2>&1 | tail -5; then
  ok "All tests passed"
else
  warn "Tests had failures — check output above"
fi

# ── 4. Done ───────────────────────────────────────────────────────────
cd ..
echo ""
echo "╔══════════════════════════════════════╗"
echo "║         Setup complete! 🎉           ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "  Next steps:"
echo "  1. code workspace/          ← open in VS Code"
echo "  2. Install recommended extensions when prompted"
echo "  3. Start with Session 1 in the course docs"
echo ""
echo "  MCP / Claude Code / Antigravity setup → see docs/workspace-setup.md"
echo ""
