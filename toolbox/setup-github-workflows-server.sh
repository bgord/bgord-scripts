#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Settuping up GitHub workflows for servers..."

mkdir -p .github/workflows

cp ./bgord-scripts/workflows/deploy-server.yml .github/workflows/deploy.yml
cp ./bgord-scripts/workflows/codeql-analysis.yml .github/workflows
cp ./bgord-scripts/workflows/changelog.yml .github/workflows

cp ./bgord-scripts/workflows/dependabot.yml .github

success "GitHub workflow for servers set up!"
