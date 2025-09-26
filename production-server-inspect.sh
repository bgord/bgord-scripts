#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

OUTPUT_DIRECTORY="output"
PROJECT_NAME=$1

validate_non_empty "PROJECT_NAME" "$PROJECT_NAME"

step_start "Production server inspect"
du -sh "$OUTPUT_DIRECTORY/$PROJECT_NAME"
step_end "Production server inspect"
