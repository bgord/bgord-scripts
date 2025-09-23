#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

IMAGE_PATH=$1

validate_non_empty "IMAGE_PATH" $IMAGE_PATH

step_start "SVG optimise"
bunx svgo $IMAGE_PATH
step_end "SVG optimise"
