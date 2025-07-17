#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Listing todos..."

ag "TODO"
