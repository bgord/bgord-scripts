#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

info "Environment: staging"
info "Building frontend..."

# ==========================================================

npx esbuild frontend/index.tsx \
  --bundle \
  --minify \
  --outdir=static/
