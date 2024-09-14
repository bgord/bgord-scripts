#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Scripts"

ls bgord-scripts/ \
  |  grep -v bun \
  |  grep -v workflows \
  |  grep -v json \
  |  grep -v base.sh \
  |  grep -v templates \
  |  grep -v toolbox \


info "Toolbox"

ls bgord-scripts/toolbox | grep -v templates
