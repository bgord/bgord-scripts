#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

FILE_TO_DECRYPT=$1

step_start "Deps cleanup"
rm -rf ~/.bun/install/cache
rm -rf node_modules/ bun.lock
step_end "Deps cleanup"
