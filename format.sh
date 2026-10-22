#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Format"
bun fmt \
  --config=bgord-scripts/templates/bun-fmt.json \
  --ignore-path=.gitignore \
  --ignore-path=bgord-scripts/templates/bun-fmt-ignore
step_end "Format"
