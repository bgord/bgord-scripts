#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

# ==========================================================

info "Building frontend..."
./bgord-scripts/frontend:build.sh --metafile=meta.json

info "Building bundle analysis"
npx esbuild-visualizer --metadata ./meta.json

info "Opening bundle analysis..."
xdg-open stats.html
