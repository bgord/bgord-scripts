#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "CSS purge"
bunx postcss static/main.min.css --replace --config bgord-scripts/templates
step_end "CSS purge"
