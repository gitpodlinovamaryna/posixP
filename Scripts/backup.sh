#!/usr/bin/env bash

PROJ=$1
PROJ_NAME=`basename "$1"`
NOW_DATE=$(date +'%Y-%m-%d-%H-%M-%S')
BACKUP_DIR_NAME="BackUps"
BACKUP_DIR_PATH=${HOME}/Documents/$BACKUP_DIR
echo $BACKUP_DIR_PATH
    if [ ! -d "$BACKUP_DIR_PATH" ];
        then mkdir $BACKUP_DIR_PATH
        fi
        cd $BACKUP_DIR_PATH
        ARCHIVE_NAME="${PROJ_NAME}_${NOW_DATE}.tar.gz"
        tar -cvzf $ARCHIVE_NAME $1
