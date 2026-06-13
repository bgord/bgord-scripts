#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if test -d ".github/workflows"
then
  info "Workflows available"
else
  info "Workflows not available"
  exit 0
fi

step_start "Check CI fix"
zizmor --pedantic --fix=all .github/ 
step_end "Check CI fix"
