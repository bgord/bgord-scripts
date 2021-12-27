#!/usr/bin/env bash

# Preload base bash configuration and functions
source bgord-scripts/base.sh

OUT_DIR="build"

info "Environment: staging"
export NODE_ENV="staging"

check_if_file_exists .env.staging
check_if_directory_exists node_modules
check_if_file_exists scripts/staging-server-start.sh
validate_environment_file

# ==========================================================

info "Building project!"

# ==========================================================

rm -rf $OUT_DIR
info "Cleaned previous build cache"

# ==========================================================

cp node_modules/@bgord/design/dist/main.min.css static/
cp node_modules/@bgord/design/dist/normalize.min.css static/
info "Copied CSS"

# ==========================================================

npx tsc --strict --esModuleInterop --outDir $OUT_DIR
info "Compiled TypeScript"

# ==========================================================

cp package.json $OUT_DIR
cp package-lock.json $OUT_DIR
cd $OUT_DIR
npm ci --omit=dev --ignore-scripts
cd ../
info "Installed packages"

# ==========================================================

if test -d static
then
  cp -r static $OUT_DIR
  info "Copied static files"
else
  info "static/ directory doesn't exist, step skipped"
fi

# ==========================================================

cp .env.staging $OUT_DIR
info "Copied .env.staging"

# ==========================================================

if test -d prisma
then
  cp -r prisma/migrations $OUT_DIR
  cp prisma/schema.prisma $OUT_DIR
  info "Copied prisma files"
else
  info "prisma/ directory doesn't exist, step skipped"
fi

# ==========================================================

cp scripts/staging-server-start.sh $OUT_DIR
info "Copied staging-server-start script"

# ==========================================================

if test -d prisma
then
  cp -r views $OUT_DIR
  info "Copied Handlebars views"
else
  info "views/ directory doesn't exist, step skipped"
fi

# ==========================================================

npx gzip build/static/*.js --extension=gz --extension=br
npx gzip build/static/*.css --extension=gz --extension=br
npx gzip build/static/*.png --extension=gz --extension=br
npx gzip build/static/*.html --extension=gz --extension=br
info "Compressing static files"

# ==========================================================
success "Project built correctly!"
