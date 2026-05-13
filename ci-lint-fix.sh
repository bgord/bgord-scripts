#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "CI lint"
zizmor --pedantic --fix=all .github/ 
step_end "CI lint"
