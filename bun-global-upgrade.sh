#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

step_start "Local Bun version upgrade"
# bun upgrade
press_enter_to_continue
step_end "Local Bun version upgrade"

step_start "Production Bun version upgrade"
# ssh production bun upgrade
press_enter_to_continue
step_end "Production Bun version upgrade"

step_start "Update production packages playbook"
# vim ~/Desktop/projects/production/playbooks/packages/playbook-packages.yml
press_enter_to_continue
step_end "Update production packages playbook"

step_start "Update deploy-server GitHub workflow"
# vim ~/Desktop/projects/bgord-scripts/workflows/deploy-server.yml
press_enter_to_continue
step_end "Update deploy-server GitHub workflow"

step_start "Update @bgord/tools"
# ./bgord-scripts/update.sh
# vim ~/Desktop/projects/bgord-tools/package.json
press_enter_to_continue
step_end "Update @bgord/tools"

step_start "Publish new @bgord/tools version"
# ./bgord-scripts/npm-publish.sh patch
press_enter_to_continue
step_end "Publish new @bgord/tools version"

step_start "Update Bun version in @bgord/bun"
# ./bgord-scripts/update.sh
# vim ~/Desktop/projects/bgord-bun/package.json
press_enter_to_continue
step_end "Update Bun version in @bgord/bun"

step_start "Publish new @bgord/bun version"
# ./bgord-scripts/npm-publish.sh patch
press_enter_to_continue
step_end "Publish new @bgord/bun version"

step_start "Update bgord-scripts in Lobbygow"
# cp bgord-scripts/workflows/deploy-server.yml .github/workflows
press_enter_to_continue
step_end "Update bgord-scripts in Lobbygow"

step_start "Update Bun version in Lobbygow"
# vim ~/Desktop/projects/lobbygow/package.json
press_enter_to_continue
step_end "Update Bun version in Lobbygow"

step_start "Update Bun version in Lobbygow prerequisites"
# vim ~/Desktop/projects/lobbygow/infra/tools/prerequisites.ts
press_enter_to_continue
step_end "Update Bun version in Lobbygow prerequisites"

step_start "Release Lobbygow"
press_enter_to_continue
step_end "Release Lobbygow"

step_start "Update bgord-scripts in Journal"
# cp bgord-scripts/workflows/deploy-server.yml .github/workflows
press_enter_to_continue
step_end "Update bgord-scripts in Journal"

step_start "Update Bun version in Journal"
# vim ~/Desktop/projects/journal/package.json
press_enter_to_continue
step_end "Update Bun version in Journal"

step_start "Update Bun version in journal prerequisites"
# vim ~/Desktop/projects/journal/infra/tools/prerequisites.ts
press_enter_to_continue
step_end "Update Bun version in journal prerequisites"

step_start "Release Journal"
press_enter_to_continue
step_end "Release Journal"
