#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

ensure_web_set_up

step_start "Code visualize"
bunx fallow viz --config bgord-scripts/templates/fallow-dead-code.json
step_end "Code visualize"
