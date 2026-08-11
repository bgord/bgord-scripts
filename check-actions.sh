#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

check_if_directory_exists ".github/workflows"

step_start "Check actions"

OUTPUT=$(bunx actions-up --dry-run --recursive --quiet --dir .github/workflows 2>&1)

echo "$OUTPUT"

if grep -q 'updates available' <<<"$OUTPUT"; then
  error "There are outdated actions."
  exit 1
fi

step_end "Check actions"
