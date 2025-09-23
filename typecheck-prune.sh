#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Typecheck prune"
bunx knip --strict --exclude unlisted,binaries,dependencies --config bgord-scripts/templates/knip.json
step_end "Typecheck prune"
