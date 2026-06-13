#!/usr/bin/env bash
source bgord-scripts/base.sh
setup_base_config

step_start "Complexity health analysis (fallow)"
bunx fallow health --config bgord-scripts/templates/fallow-health.json
step_end "Complexity health analysis (fallow)"
