#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "cloc"
bunx cloc index.ts server.ts infra/ modules/ app/ web/ --exclude-ext=js,json,sql,md,svg --timeout 0
step_end "cloc"
