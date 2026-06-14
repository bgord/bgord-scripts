#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Typecheck watch"

bunx tsgo --watch --preserveWatchOutput --project tsconfig.json --noEmit
