#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "CI lint"
zizmor .github/
step_end "CI lint"
