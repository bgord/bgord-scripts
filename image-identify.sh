#!/usr/bin/env bash

source bgord-scripts/base.sh

info "Identifying image..."

IMAGE_PATH=$1

validate_non_empty "IMAGE_PATH" $IMAGE_PATH

magick identify $IMAGE_PATH
