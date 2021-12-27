#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

OUTPUT_PATH=$1

info "Setting up Handlebars..."

check_if_directory_does_not_exist "views"

mkdir -p views/layouts
cp bgord-scripts/templates/main.hbs views/layouts
cp bgord-scripts/templates/home.hbs views

info 'Add response.render("home"); to a route handler'
info 'Add new bg.Handlebars().applyTo(app); to index.ts file'

success "Handlebars set up!"
