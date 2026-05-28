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

step_start "CI lint"
zizmor --pedantic .github/
step_end "CI lint"
