#!/usr/bin/env bash

PROJ=$1
PROJ_NAME=`basename "$1"`
NOW_DATE=$(date +'%Y-%m-%d-%H-%M-%S')
BACKUP_DIR_NAME="BackUps"
BACKUP_DIR_PATH=${HOME}/Documents/${BACKUP_DIR_NAME}
echo $BACKUP_DIR_PATH
    if [ ! -d "$BACKUP_DIR_PATH" ];
        then mkdir $BACKUP_DIR_PATH
        fi
        cp -R $1 $BACKUP_DIR_PATH/
        ARCHIVE_NAME="${PROJ_NAME}_${NOW_DATE}.tar.gz"
        cd $BACKUP_DIR_PATH
        tar -cvzf $ARCHIVE_NAME $PROJ_NAME
        rm -rf $PROJ_NAME
        
        
        
        
