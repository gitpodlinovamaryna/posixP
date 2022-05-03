#!/usr/bin/env bash


PROJ=${HOME}/Documents/PosixShellAndUtilities/progC

PROJ_NAME=`basename "$PROJ"`
NOW_DATE=$(date +'%Y-%m-%d-%H-%M-%S')

# check and create directory:
NEW_PROJECT_DIR="Project_c"
ARCHIVES_DIR_PATH=${HOME}/Documents/PosixShellAndUtilities/$NEW_PROJECT_DIR
echo $ARCHIVES_DIR_PATH
cd ../..
    if [ ! -d "$NEW_PROJECT_DIR" ];
        then mkdir $NEW_PROJECT_DIR
        fi

        cd $NEW_PROJECT_DIR

        #Copy folder with project 
        cp -R $PROJ $ARCHIVES_DIR_PATH
        ARCHIVE_NAME="${PROJ_NAME}_${NOW_DATE}.tar.gz"
    
        cd $ARCHIVES_DIR_PATH
        # create archive:
        tar -cvzf $ARCHIVE_NAME $PROJ_NAME

        #Copy archive to InstallatorScripts dir
        cp $ARCHIVES_DIR_PATH/$ARCHIVE_NAME $PROJ/installatorScripts/
    
        # delete folder:
        rm -rf $PROJ_NAME
        printf "APP_NAME = progC
        APP_PATH = ${HOME}/Documents/progC
        APP_INSTALL_PATH = ${HOME}/Documents/
        APP_INSTALL_DIR = progC/
        APP_ARCHIVE_NAME = ${ARCHIVE_NAME}
        APP_ARCHIVE_PATH = ${HOME}/Documents/project_c/${ARCHIVE_NAME}" $USER > .my-settings.txt


        cd ../
        cd progC

        printf "APP_NAME = progC
        APP_PATH = ${HOME}/Documents/PosixShellAndUtilities/progC
        APP_INSTALL_PATH = ${HOME}/Documents/
        APP_INSTALL_DIR = progC/
        APP_ARCHIVE_NAME = ${ARCHIVE_NAME}
        APP_ARCHIVE_PATH = ${HOME}/Documents/PosixShellAndUtilities/project_c/${ARCHIVE_NAME}" $USER > ../progC/InstallatorScripts/.my-settings.txt