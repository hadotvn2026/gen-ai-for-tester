#!/bin/bash
# Daily research runner — reads program.md + topics.md, searches web, writes findings
# Called by launchd every morning or run manually: bash scripts/daily-research.sh

set -e

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DATE=$(date +%Y-%m-%d)
LOG="$REPO/research/logs/$DATE.log"

echo "[$(date)] Starting daily research..." | tee "$LOG"

cd "$REPO"

# Run Claude Code in non-interactive mode
/Users/hado/.local/bin/claude --print "
You are a research assistant for the course 'Generative AI for Testers'.

1. Read the file research/program.md — this is your mission and output format.
2. Read the file research/topics.md — this is what to search for.
3. Search the web for developments in the past 7 days across the key topics.
4. Write your findings to research/daily/$DATE.md following the format in program.md.
5. Append one summary line to research/changelog.md in this format:
   $DATE | N findings | one-line summary

Be selective: only include findings that meaningfully affect course accuracy or usefulness.
Skip hype, skip already-covered topics, focus on actionable updates for QA testers.
" 2>&1 | tee -a "$LOG"

# Commit research output
git add research/daily/$DATE.md research/changelog.md 2>/dev/null || true
if git diff --cached --quiet; then
  echo "[$(date)] Nothing new to commit." | tee -a "$LOG"
else
  git commit -m "research: daily findings $DATE" 2>&1 | tee -a "$LOG"
  git push 2>&1 | tee -a "$LOG"
  echo "[$(date)] Committed and pushed." | tee -a "$LOG"
fi
