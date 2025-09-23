#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Typechecking watch"

bunx tsc --watch --preserveWatchOutput --project tsconfig.json --noEmit
