#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Autoupdate"

cd bgord-scripts/
git pull origin master

cd ../
git add bgord-scripts/
git commit -m "step: bump bgord/scripts" --no-verify

step_end "Autoupdate"
