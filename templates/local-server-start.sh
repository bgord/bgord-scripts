#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

if test -f "scripts/local-server-start.sh"
then
  info "Local server start script exists"
  bash scripts/local-server-start.sh
  exit
else
  info "Local server start script does not exist"
fi

info "Environment: local"
info "Starting project..."

# ==========================================================

cp node_modules/@bgord/design/dist/main.min.css static/
cp node_modules/@bgord/design/dist/normalize.min.css static/
info "Copied CSS from @bgord/design"

# ==========================================================

./bgord-scripts/frontend-build.sh
info "Built frontend"

# ==========================================================

export NODE_ENV="local"

node \
  --import=tsx \
  --env-file=".env.$NODE_ENV" \
  --watch-path=app/ \
  --watch-path=index.ts \
  --watch-path=infra/ \
  --watch-path=modules/ \
  --watch-path=.env.local/ \
  index.ts
