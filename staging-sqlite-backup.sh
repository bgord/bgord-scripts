#!/usr/bin/env bash

echo "Environment: staging"

PROJECT_NAME=$1
CURRENT_TIME=$(date +%F-%H-%M-%S)

DATABASE_PATH="/var/www/$PROJECT_NAME/sqlite.db"
BACKUP_PATH="/var/backups/$PROJECT_NAME/$CURRENT_TIME.sqlite.backup"

echo "Creating a backup of database: $DATABASE_PATH."
sqlite3 $DATABASE_PATH ".backup $BACKUP_PATH"
echo "Backup created to: $BACKUP_PATH."

gzip $BACKUP_PATH
echo "Backup compressed."
