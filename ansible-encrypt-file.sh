#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

goal "Encrypt a file with ansible-vault"

FILE_TO_ENCRYPT=$1

validate_non_empty "FILE_TO_ENCRYPT" $FILE_TO_ENCRYPT
check_if_file_exists $FILE_TO_ENCRYPT

ansible-vault encrypt $FILE_TO_ENCRYPT --vault-password-file ansible-vault-password.txt
