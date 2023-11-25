#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Running shellcheck..."

npx shellcheck \
  --external-sources \
  --enable=all \
  --exclude=SC2248,SC2250 \
  scripts/*.sh
