#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Typechecking continuously..."
npx tsc --watch --preserveWatchOutput --project tsconfig.json --noEmit
