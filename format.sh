#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Files format"
bunx @biomejs/biome format --write --config-path=bgord-scripts/templates/biome.json
step_end "Files format"
