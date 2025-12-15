#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Gitleaks scan"
bunx gitleaks detect --source . --verbose --redact --config bgord-scripts/templates/gitleaks.toml
step_end "Gitleaks scan"
