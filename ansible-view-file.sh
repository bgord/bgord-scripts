#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

goal "View an encrypted file with ansible-vault"

FILE_TO_VIEW=$1

validate_non_empty "FILE_TO_VIEW" $FILE_TO_VIEW
check_if_file_exists $FILE_TO_VIEW

ansible-vault view $FILE_TO_VIEW --vault-password-file ansible-vault-password.txt
