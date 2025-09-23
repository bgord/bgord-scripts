#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "TODO list"
ag "TODO"
step_end "TODO list"
