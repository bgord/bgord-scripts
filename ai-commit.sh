#!/usr/bin/env bash
set -euo pipefail

MODEL="qwen2.5:7b"
PROMPT_FILE="bgord-scripts/templates/ai-commit.txt"

MAX_DIFF_LINES=300

if ! git diff --cached --quiet; then
  DIFF_STAT=$(git diff --staged --stat)
  DIFF_FULL=$(git diff --staged | sed -n "1,${MAX_DIFF_LINES}p")
else
  echo "No staged changes."
  exit 1
fi

PROMPT="$(cat "$PROMPT_FILE")"

FULL_PROMPT="$PROMPT

=== DIFF STATS ===
$DIFF_STAT

=== DIFF (TRUNCATED TO ${MAX_DIFF_LINES} LINES) ===
$DIFF_FULL
"

RESPONSE=$(curl -s http://localhost:11434/api/generate \
  -d "$(jq -n \
    --arg model "$MODEL" \
    --arg prompt "$FULL_PROMPT" \
    '{model:$model, prompt:$prompt, stream:false}')")

MESSAGE=$(echo "$RESPONSE" | jq -r '.response' | sed '/^$/d')

if [ -z "$MESSAGE" ]; then
  echo "AI did not generate a commit message."
  exit 1
fi

TMP_FILE=$(mktemp /tmp/git-ai-commit.XXXXXX)

cleanup() {
  rm -f "$TMP_FILE"
}
trap cleanup EXIT

echo "$MESSAGE" > "$TMP_FILE"

echo
echo "Opening editor to review / edit the commit message..."
echo

nvim "$TMP_FILE"

FINAL_MESSAGE=$(sed '/^$/d' "$TMP_FILE")

if [ -z "$FINAL_MESSAGE" ]; then
  echo "Commit message is empty. Aborted."
  exit 1
fi

echo
echo "Final commit message:"
echo "---------------------"
echo "$FINAL_MESSAGE"
echo "---------------------"
echo

read -p "Commit with this message? [y/N] " CONFIRM

if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
  git commit -m "$FINAL_MESSAGE"
else
  echo "Aborted."
  exit 1
fi
