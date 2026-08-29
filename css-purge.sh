#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "CSS purge"
node_modules/.bin/bgord-css-purge public/main.min.css
step_end "CSS purge"
