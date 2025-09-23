#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Dependencies check"
if test -f "infra/depcruise.webpack.cjs"
then
  info "infra/depcruise.webpack.cjs file exists!"
  bunx depcruise --config bgord-scripts/templates/dependency-cruiser.config.cjs "modules/**" "app/**" "infra/**"
else
  info "infra/depcruise.webpack.cjs file doesn't exist, skippng"
fi
step_end "Dependencies check"
