#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Detecting spelling mistakes..."

git ls-files \
  | grep -v "package.json" \
  | grep -v "prisma" \
  | grep -v "infra/translations/pl.json" \
  | grep -v "dist" \
  | grep -v "LICENSE" \
  | grep -v "CHANGELOG" \
  | grep -v "static" \
  | npx cspell \
  --file-list stdin \
  --locale "en" \
  --unique \
  --no-progress \
  --cache \
  --config "bgord-scripts/cspell.json" \
  $@

success "Files are correct!"
