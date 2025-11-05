#!/usr/bin/env bash

source bgord-scripts/base.sh
setup_base_config

PROJECT_NAME=$1
BASIC_AUTH_HEADER=$2

validate_non_empty "PROJECT_NAME" $PROJECT_NAME
validate_non_empty "BASIC_AUTH_HEADER" $BASIC_AUTH_HEADER

step_start "Healthcheck request"
http GET https://$PROJECT_NAME.bgord.dev/api/healthcheck Authorization:"Basic $BASIC_AUTH_HEADER"
step_end "Healthcheck request"
