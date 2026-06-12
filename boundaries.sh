#!/usr/bin/env bash
source bgord-scripts/base.sh
setup_base_config

step_start "Dependencies import check"
bunx fallow dead-code --boundary-violations --config bgord-scripts/templates/fallow-boundaries.json
step_end "Dependencies import check"
