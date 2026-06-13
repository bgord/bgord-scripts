#!/usr/bin/env bash
source bgord-scripts/base.sh
setup_base_config

step_start "Code duplication analysis (fallow)"
bunx fallow dupes --config bgord-scripts/templates/fallow-duplication.json
step_end "Code duplication analysis (fallow)"
