#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Check shell"
bunx shellcheck \
  --external-sources \
  --enable=all \
  --exclude=SC2248,SC2250,SC1008 \
  scripts/*.sh
step_end "Check shell"
