#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

check_if_directory_exists ".github/workflows"

step_start "Check actions"

OUTPUT=$(bunx actions-up --json --recursive --quiet --dir .github/workflows)
UPDATES=$(jq '.summary.totalUpdates + .summary.totalRunnerUpdates' <<<"$OUTPUT")

if [ "$UPDATES" -gt 0 ]; then
  jq -r '.updates[] | "\(.action.file):\(.action.line) \(.action.uses)"' <<<"$OUTPUT"
  error "There are outdated actions."
  exit 1
fi

step_end "Check actions"
