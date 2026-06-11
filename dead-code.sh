#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Dead code analysis (fallow)"
bunx fallow dead-code --config bgord-scripts/templates/fallow-dead-code.json
step_end "Dead code analysis (fallow)"
