#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

info "Copying robots.txt file"

cp bgord-scripts/templates/robots.txt static/

info "[NOTE] Modify the path to your sitemap.xml file in static/robots.txt"

success "robots.txt file copied!"
