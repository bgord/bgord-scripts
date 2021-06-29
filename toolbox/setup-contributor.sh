#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Setting up contributor..."

info "Adding .contributor.example..."
if test -f ".contributor.example"
then
  info "$1 file already exist, skipping"
else
  info "$1 file doesn't exist, creating..."
  cp bgord-scripts/.contributor.example .
fi

info "Adding .contributor..."
if test -f ".contributor"
then
  info "$1 file already exist, skipping"
else
  info "$1 file doesn't exist, creating..."
  cp bgord-scripts/.contributor.example .contributor
fi

success "Contributor set up!"
