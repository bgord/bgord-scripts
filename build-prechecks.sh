#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

info "Running build prechecks..."

./bgord-scripts/typecheck.sh
./bgord-scripts/lint.sh
./bgord-scripts/test-run.sh
