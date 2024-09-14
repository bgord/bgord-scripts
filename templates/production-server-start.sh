#!/usr/bin/env bash

echo "Environment: production"
echo "Starting project..."

export NODE_ENV="production"

cd /var/www/{{PROJECT_NAME}}/ || exit
npx prisma migrate deploy
npx prisma generate
node --require tsx/cjs index.js
