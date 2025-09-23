#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Commit message lint"
bunx commitlint --edit --config bgord-scripts/templates/.commitlint-config.cjs
step_end "Commit message lint"
