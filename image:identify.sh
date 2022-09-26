#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

info "Identifying image..."

local PATH=$1

validate_non_empty "PATH" $PATH

magick identify $PATH
