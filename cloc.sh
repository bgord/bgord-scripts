#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Counting lines of code..."

bunx cloc index.ts server.ts infra/ modules/ app/ frontend/ --exclude-ext=js,json,sql,md,svg
