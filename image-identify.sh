#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

IMAGE_PATH=$1

info "Identifying image..."

validate_non_empty "IMAGE_PATH" $IMAGE_PATH

magick identify $IMAGE_PATH

info "Image identified!"
