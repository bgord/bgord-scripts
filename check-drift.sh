#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

PAIRS=(
  ".github/workflows/server-build.yml:bgord-scripts/workflows/server-build.yml"
  ".github/workflows/server-deploy.yml:bgord-scripts/workflows/server-deploy.yml"
  ".github/workflows/healthcheck.yml:bgord-scripts/workflows/healthcheck.yml"
  "bunfig.toml:bgord-scripts/templates/bunfig.toml"
)

step_start "Check drift"

for pair in "${PAIRS[@]}"; do
  IFS=: read -r FILE TEMPLATE <<<"$pair"

  test -f "$FILE" || continue

  STATUS=0
  diff -u "$TEMPLATE" "$FILE" > /dev/null || STATUS=$?

  if test "$STATUS" -eq 0; then
    success "$FILE matches $TEMPLATE"
    continue
  fi

  if test "$STATUS" -gt 1; then
    error "❌  Comparison failed: $TEMPLATE or $FILE not found."
  else
    # If the exit code was 1, the files differ. Print the difference.
    error "$FILE differs from $TEMPLATE:"
    # Use the labels when printing the diff for user clarity
    diff -u --color=always --label "$TEMPLATE" --label "$FILE" "$TEMPLATE" "$FILE"
  fi
  
  exit 1
done

step_end "Check drift"

exit 0
