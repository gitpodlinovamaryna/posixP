#!/usr/bin/env bash

RESTORE_DIR_NAME="Restored"
RESTORE_DIR_PATH=${HOME}/Documents/${RESTORE_DIR_NAME}
echo $RESTORE_DIR_PATH
    if [ ! -d "$RESTORE_DIR_PATH" ];
        then mkdir $RESTORE_DIR_PATH
        fi
cd $RESTORE_DIR_PATH
tar -xf $1