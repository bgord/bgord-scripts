#!/usr/bin/env bash

echo "Environment: production"
echo "Starting project..."

export NODE_ENV="production"

cd /var/www/trackers/ || exit
npx prisma migrate deploy
npx prisma generate
node --require tsx/cjs index.js
