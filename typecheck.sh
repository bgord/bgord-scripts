#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Typecheck"
bunx tsgo --project tsconfig.json --noEmit
step_end "Typecheck"
