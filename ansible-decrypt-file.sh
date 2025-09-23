#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

FILE_TO_DECRYPT=$1

step_start "Ansible decrypt file"

validate_non_empty "FILE_TO_DECRYPT" $FILE_TO_DECRYPT
check_if_file_exists $FILE_TO_DECRYPT
ansible-vault decrypt $FILE_TO_DECRYPT --vault-password-file ansible-vault-password.txt

step_end "Ansible decrypt file"
