#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Watching and rebuilding frontend..."
npx esbuild \
  --bundle \
  --watch frontend/index.tsx \
  --outdir=static
