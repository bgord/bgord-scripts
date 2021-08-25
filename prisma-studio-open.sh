#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Opening Prisa Studio..."
npx prisma studio --port 9090
