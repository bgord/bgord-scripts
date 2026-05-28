#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

PAIRS=(
  ".github/workflows/deploy-server.yml:bgord-scripts/workflows/deploy-server.yml"
  ".github/workflows/healthcheck.yml:bgord-scripts/workflows/healthcheck.yml"
  "bunfig.toml:bgord-scripts/templates/bunfig.toml"
)

step_start "Compare configs"

for pair in "${PAIRS[@]}"; do
  IFS=: read -r FILE TEMPLATE <<<"$pair"

  test -f "$FILE" || continue

  if diff -u --color=always "$TEMPLATE" "$FILE" > /dev/null; then
    success "$FILE matches $TEMPLATE"
    continue
  fi

  if [ $? -eq 2 ]; then
    error "❌  Comparison failed: $TEMPLATE or $FILE not found."
  else
    # If the exit code was 1, the files differ. Print the difference.
    error "$FILE differs from $TEMPLATE:"
    # Use the labels when printing the diff for user clarity
    diff -u --color=always --label "$TEMPLATE" --label "$FILE" "$TEMPLATE" "$FILE"
  fi
  
  exit 1
done

step_end "Compare configs"

exit 0
