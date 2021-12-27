#!/usr/bin/env bash

echo "Environment: staging"
echo "Starting project..."

export NODE_ENV="staging"

cd /var/www/{{PROJECT_NAME}}/
node index.js
