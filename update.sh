#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Update"

cd bgord-scripts/
git pull origin master

cd ../
git add bgord-scripts/
git commit -m "Bump bgord/scripts" --no-verify

step_end "Update"
