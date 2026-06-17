#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

check_if_file_exists "package.json"

step_start "Check engines"

dev_engines_check

step_end "Check engines"
