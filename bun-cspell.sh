#!/usr/bin/env bash

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
  | grep -v "changelog.md" \
  | grep -v "static" \
  | grep -v "env" \
  | grep -v "github" \
  | grep -v "gitignore" \
  | bunx cspell \
  --file-list stdin \
  --locale "en" \
  --unique \
  --no-progress \
  --cache \
  --config "bgord-scripts/cspell.json" \
  $@

success "Files are correct!"
