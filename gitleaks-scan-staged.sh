#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

check_if_binary_exists "gitleaks"

step_start "Gitleaks scan staged"
gitleaks protect --staged --verbose --redact --config bgord-scripts/templates/gitleaks.toml
step_end "Gitleaks scan staged"
