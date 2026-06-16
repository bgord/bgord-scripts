#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Check package config"
bunx publint --pack bun --strict
step_end "Check package config"
