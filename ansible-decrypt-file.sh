#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh
setup_base_config

goal "Decrypt a file with ansible-vault"

FILE_TO_DECRYPT=$1

validate_non_empty "FILE_TO_DECRYPT" $FILE_TO_DECRYPT
check_if_file_exists $FILE_TO_DECRYPT

ansible-vault decrypt $FILE_TO_DECRYPT --vault-password-file ansible-vault-password.txt
