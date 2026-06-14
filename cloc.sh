#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "cloc"
bunx cloc index.ts server.ts infra/ modules/ app/ web/ --exclude-ext=js,json,sql,md,svg
step_end "cloc"
