#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

PAIRS=(
  ".github/workflows/deploy-server.yml:bgord-scripts/workflows/deploy-server.yml"
  ".github/workflows/docs-app.yml:bgord-scripts/workflows/docs-app.yml"
  ".github/workflows/docs-package.yml:bgord-scripts/workflows/docs-package.yml"
  ".github/workflows/healthcheck.yml:bgord-scripts/workflows/healthcheck.yml"
  "lefthook.yml:bgord-scripts/templates/lefthook-target.yml"
)

ALL_OK=true

for pair in "${PAIRS[@]}"; do
  IFS=: read -r FILE TEMPLATE <<<"$pair"

  # Presence checks
  [[ -f "$FILE" ]] || continue
  [[ -f "$TEMPLATE" ]] || { error "❌  $TEMPLATE not found";  ALL_OK=false; continue; }

  # Comparison
  if diff -u --color=always --label "$TEMPLATE" --label "$FILE" "$TEMPLATE" "$FILE" > /dev/null; then
    success "$FILE matches $TEMPLATE"
  else
    error "$FILE differs from $TEMPLATE:"
    diff -u --color=always --label "$TEMPLATE" --label "$FILE" "$TEMPLATE" "$FILE" || true
    ALL_OK=false
  fi
done

$ALL_OK && exit 0 || exit 1
