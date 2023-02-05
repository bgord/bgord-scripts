#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

mkdir -p .github/workflows

cp ./bgord-scripts/workflows/deploy-project.yml .github/workflows
cp ./bgord-scripts/workflows/codeql-analysis.yml .github/workflows

success "GitHub workflow for project set up!"
