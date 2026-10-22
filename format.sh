#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Format"
bun fmt \
  --config=bgord-scripts/templates/bun-fmt.json \
  --ignore-path=.gitignore \
  "${BUN_FMT_IGNORE[@]}"
step_end "Format"
