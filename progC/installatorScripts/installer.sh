#!/usr/bin/env bash

function install(){
{
        if [ ! -d "${APP_INSTALL_PATH}/${APP_NAME}" ]; then
        mkdir "${APP_INSTALL_PATH}/${APP_NAME}"
        gcc ./*c -o "$APP_NAME"
        mv "$APPNAME" "$APP_INSTALL_PATH"
}

function remove(){
    if [ -d "${APP_INSTALL_PATH}/${APP_NAME}" ]; then
        rm -r "${APP_INSTALL_PATH:?}/${APP_NAME:?}"
        return 0
    else
        echo "Error"
        return 1
    fi
}

function update_settings(){
        printf "APP_NAME = progC
        APP_PATH = ${HOME}/Documents/progC
        APP_INSTALL_PATH = ${HOME}/Documents/
        APP_INSTALL_DIR = progC/
        APP_ARCHIVE_NAME = ${ARCHIVE_NAME}
        APP_ARCHIVE_PATH = ${HOME}/Documents/project_c/${ARCHIVE_NAME}" $USER > .my-settings.txt
}

function main(){
update_settings
printf "1 - Install app\n 2 - Remove app\n 3 - Exit:\n "
read -p CHOICE
case "$CHOICE" in 
1)  install
    break
    ;;
2)  remove
    break
    ;;
3)  exit 0
    ;;
}
main