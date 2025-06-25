#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

IMAGE_PATH=$1

info "Optimising image..."

validate_non_empty "IMAGE_PATH" $IMAGE_PATH

bunx svgo $IMAGE_PATH

success "Image optimised!"
