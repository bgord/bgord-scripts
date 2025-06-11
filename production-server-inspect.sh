#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

OUTPUT_DIRECTORY="build"

PROJECT_NAME=$1

validate_non_empty "PROJECT_NAME" "$PROJECT_NAME"

du -sh "$OUTPUT_DIRECTORY/$PROJECT_NAME"
