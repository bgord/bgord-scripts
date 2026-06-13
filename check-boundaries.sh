#!/usr/bin/env bash
source bgord-scripts/base.sh
setup_base_config

step_start "Check boundaries"
bunx fallow dead-code --boundary-violations --config bgord-scripts/templates/fallow-boundaries.json
step_end "Check boundaries"
