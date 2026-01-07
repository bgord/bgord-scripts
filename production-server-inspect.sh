#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

OUTPUT_DIRECTORY="output"
PROJECT_NAME=$1

validate_non_empty "PROJECT_NAME" "$PROJECT_NAME"

step_start "Output directory list"
ls -al "$OUTPUT_DIRECTORY"
step_end "Output directory list"
