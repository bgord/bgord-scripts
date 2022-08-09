#!/usr/bin/env bash

echo "Environment: staging"

PROJECT_NAME=$1
CURRENT_TIME=$(date +%F-%H-%M-%S)

DATABASE_PATH="/var/www/$PROJECT_NAME/sqlite.db"
BACKUPS_PATH="/var/backups/$PROJECT_NAME"
BACKUP_PATH="$BACKUPS_PATH/$CURRENT_TIME.sqlite.backup"

echo "Creating a backup of database: $DATABASE_PATH."
sqlite3 $DATABASE_PATH ".backup $BACKUP_PATH"
echo "Backup created to: $BACKUP_PATH."

gzip $BACKUP_PATH
echo "Backup compressed."

find $BACKUPS_PATH/* -mtime +7 -exec rm {} \;
echo "Files older than 7 days deleted"
