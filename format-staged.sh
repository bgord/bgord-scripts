#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Format staged"
bun fmt \
  --staged \
  --no-error-on-unmatched-pattern \
  --config=bgord-scripts/templates/bun-fmt.json \
  --ignore-path=.gitignore \
  "${BUN_FMT_IGNORE[@]}"
step_end "Format staged"
