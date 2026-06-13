#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Check dead code"
bunx fallow dead-code --config bgord-scripts/templates/fallow-dead-code.json
step_end "Check dead code"
