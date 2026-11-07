#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

check_if_binary_exists "shellcheck"

step_start "Check shell"
shellcheck \
  --external-sources \
  --enable=all \
  --exclude=SC2248,SC2250,SC1008 \
  scripts/*.sh
step_end "Check shell"
