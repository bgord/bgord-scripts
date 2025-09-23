#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

IMAGE_PATH=$1

validate_non_empty "IMAGE_PATH" $IMAGE_PATH

step_start "Image identify"
magick identify $IMAGE_PATH
step_end "Image identify"
