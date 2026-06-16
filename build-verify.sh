#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

./bgord-scripts/typecheck.sh
./bgord-scripts/check-dead-code.sh
./bgord-scripts/test.sh
./bgord-scripts/check-drift.sh
./bgord-scripts/check-deps-pin.sh
./bgord-scripts/check-boundaries.sh
./bgord-scripts/check-deps-ensure.sh
./bgord-scripts/check-deps-audit.sh
./bgord-scripts/check-lockfile.sh
./bgord-scripts/check-shell.sh
./bgord-scripts/check-code.sh
./bgord-scripts/check-secrets.sh
./bgord-scripts/e2e-run.sh
