#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Compress public assets"
bun bgord-scripts/assets-compress.ts
step_end "Compress public assets"
