#!/usr/bin/env bash

#A script, which restores wrom archive project to the Restored directory

# $1 -  archive;

# check directory (create new directory):
RESTORE_DIR_NAME="Restored"
RESTORE_DIR_PATH=${HOME}/Documents/${RESTORE_DIR_NAME}
echo $RESTORE_DIR_PATH
    if [ ! -d "$RESTORE_DIR_PATH" ];
        then mkdir $RESTORE_DIR_PATH
        fi
cd $RESTORE_DIR_PATH

# exstract archive to the Restored directory
tar -xf $1