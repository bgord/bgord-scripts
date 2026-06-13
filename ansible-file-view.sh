#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

FILE_TO_VIEW=$1

step_start "Ansible view file"

validate_non_empty "FILE_TO_VIEW" $FILE_TO_VIEW
check_if_file_exists $FILE_TO_VIEW
ansible-vault view $FILE_TO_VIEW --vault-password-file ansible-vault-password.txt

step_end "Ansible view file"
