#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config
set_node_timezone_to_utc

export NODE_ENV="test"

step_start "Mutation test"
bunx stryker run bgord-scripts/templates/stryker.config.json
step_end "Mutation test"
