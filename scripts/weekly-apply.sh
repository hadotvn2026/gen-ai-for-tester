#!/bin/bash
# Weekly apply — reads all daily findings from the past 7 days,
# proposes and applies targeted edits to session markdown files.
# Run manually every Monday: bash scripts/weekly-apply.sh

set -e

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DATE=$(date +%Y-%m-%d)
LOG="$REPO/research/logs/apply-$DATE.log"

echo "[$(date)] Starting weekly apply..." | tee "$LOG"

cd "$REPO"

# Collect last 7 daily files
DAILY_FILES=$(find research/daily -name "*.md" -newer research/daily/.gitkeep \
  ! -name ".gitkeep" | sort | tail -7 | tr '\n' ' ')

if [ -z "$DAILY_FILES" ]; then
  echo "No daily research files found. Run daily-research.sh first." | tee -a "$LOG"
  exit 0
fi

echo "Processing: $DAILY_FILES" | tee -a "$LOG"

/Users/hado/.local/bin/claude --print "
You are a content editor for the course 'Generative AI for Testers' (Vietnamese, QA audience).

1. Read these daily research files: $DAILY_FILES
2. Read the current session files: docs/sessions/session-01-mindset.md through session-06-agentic-ai.md
3. For each actionable finding, apply a minimal targeted edit to the relevant session file:
   - Update outdated tool versions or feature descriptions
   - Add a new real-world example if one was found
   - Fix factually incorrect statements
   - Do NOT rewrite sections — surgical edits only
4. After editing, write a summary to research/apply-$DATE.md listing:
   - What was changed
   - Which file/section
   - Why

Keep the Vietnamese tone, do not change the structure of sessions.
If a finding is not strong enough to warrant an edit, skip it.
" 2>&1 | tee -a "$LOG"

# Commit applied changes
git add docs/sessions/ research/apply-$DATE.md 2>/dev/null || true
if git diff --cached --quiet; then
  echo "[$(date)] No changes applied." | tee -a "$LOG"
else
  git commit -m "content: weekly apply from research $DATE" 2>&1 | tee -a "$LOG"
  git push 2>&1 | tee -a "$LOG"
  echo "[$(date)] Changes committed and pushed." | tee -a "$LOG"
fi
