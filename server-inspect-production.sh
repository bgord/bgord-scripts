#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

OUTPUT_DIRECTORY="output"

step_start "Server inspect production"
ls -al "$OUTPUT_DIRECTORY"
step_end "Server inspect production"
