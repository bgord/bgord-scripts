#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

info "Copying robots.txtf file"

cp bgord-scripts/templates/robots.txt static/

info "[NOTE] Modify the path to your sitemap.xml file in static/robots.txt"

success "robots.txtf file copied!"
