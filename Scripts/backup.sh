#!/usr/bin/env bash
PROJ=$[ $1 ]
NOW_DATE=$(date +'%Y-%m-%d-%H-%M-%S')

BACKUP_DIR="BackUps"
BACKUP_DIR_PATH=${HOME}/Documents/${BACKUP_DIR}
    if [ ! -d "$BACKUP_DIR_PATH" ];
        then mkdir $BACKUP_DIR_PATH
        fi
        
        ARCHIVE_NAME="${PROJ}_${NOW_DATE}--cc.tar.gz"
        
