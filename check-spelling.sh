#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Check spelling"
git ls-files \
  | grep -v "package.json" \
  | grep -v "readme.md" \
  | grep -v "infra/translations/pl.json" \
  | grep -v "infra/drizzle" \
  | grep -v "dist" \
  | grep -v "LICENSE" \
  | grep -v "env" \
  | grep -v "github" \
  | grep -v "gitignore" \
  | bunx cspell \
  --file-list stdin \
  --locale "en" \
  --unique \
  --no-progress \
  --cache \
  --config "bgord-scripts/templates/cspell.json"
step_end "Check spelling"
