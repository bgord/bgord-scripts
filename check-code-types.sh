#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Check code types"
bunx @biomejs/biome lint \
    --config-path=bgord-scripts/templates/biome-types.json \
    --no-errors-on-unmatched \
    .
step_end "Check code types"
