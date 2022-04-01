#!/usr/bin/env bash

#A script, which creates backups (by archiving) of the PROJ project to the BACKUP_DIR directory, 
#naming the copy files PROJ_yyyy-mm-dd_hh-mm-cc.tar.gz.

# $1 - path to folder which creates archive
PROJ=$1

PROJ_NAME=`basename "$1"`
NOW_DATE=$(date +'%Y-%m-%d-%H-%M-%S')

# check and create directory:
BACKUP_DIR_NAME="BackUps"
BACKUP_DIR_PATH=${HOME}/Documents/${BACKUP_DIR_NAME}
echo $BACKUP_DIR_PATH
    if [ ! -d "$BACKUP_DIR_PATH" ];
        then mkdir $BACKUP_DIR_PATH
        fi

        # copy folder to BackUps directory:
        cp -R $1 $BACKUP_DIR_PATH/

        ARCHIVE_NAME="${PROJ_NAME}_${NOW_DATE}.tar.gz"

        cd $BACKUP_DIR_PATH
        # create archive:
        tar -cvzf $ARCHIVE_NAME $PROJ_NAME
        
        # delete folder:
        rm -rf $PROJ_NAME
        
        
        
        
