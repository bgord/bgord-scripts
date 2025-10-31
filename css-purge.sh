#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "CSS purge"
bunx --bun postcss-cli public/main.min.css --replace --config bgord-scripts/templates/postcss.config.mjs
step_end "CSS purge"
