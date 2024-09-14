#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Starting project..."

if test -f "scripts/test-project-start.sh"
then
  info "Test project start script exists"
  bash scripts/test-project-start.sh
  exit
else
  info "Test project start script does not exist"
fi

info "Environment: test"
info "Starting project..."

# ==========================================================

cp node_modules/@bgord/design/dist/main.min.css static/
cp node_modules/@bgord/design/dist/normalize.min.css static/
info "Copied CSS from @bgord/design"

# ==========================================================

./bgord-scripts/frontend-build.sh
info "Built frontend"

# ==========================================================

export NODE_ENV="test"

npx serve --listen 3333 .
