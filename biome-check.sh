#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Biome check"
bunx @biomejs/biome check \
    --config-path=bgord-scripts/templates/biome.json \
    --no-errors-on-unmatched \
    --write \
    .
step_end "Biome check"
