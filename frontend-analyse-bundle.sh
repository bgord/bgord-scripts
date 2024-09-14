#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Creating frontend bundle analysis..."

info "Building frontend..."
./bgord-scripts/frontend-build.sh --metafile=meta.json

info "Building bundle analysis"
npx esbuild-visualizer --metadata ./meta.json

info "Opening bundle analysis..."
xdg-open stats.html

success "Frontend bundle analysis created!"
