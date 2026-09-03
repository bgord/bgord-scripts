#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Deps cleanup"
rm -rf ~/.bun/install/cache
rm -rf node_modules/ bun.lock
step_end "Deps cleanup"
