#!/usr/bin/env bash
function fillMySettings(){
    local ARCHIVE_NAME=`basename "$1"`
    local ARCHIVE_PATH=$1
    local INSTALL_PATH=$2
    local APP_PATH=$3
    cd $APP_PATH
    printf "APP_NAME = progC
        APP_PATH = ${APP_PATH}
        APP_INSTALL_PATH = ${INSTALL_PATH}
        APP_ARCHIVE_NAME = ${ARCHIVE_NAME}
        APP_ARCHIVE_PATH = ${ARCHIVE_PATH}" $USER > ${APP_PATH}/.my-settings.txt
}


function unpacking(){
    
    local APP_ARCHIVE_PATH=$1
    local APP_INSTALL_PATH=$2
    if [ ! -d "${APP_INSTALL_PATH}" ]; then
    mkdir "${APP_INSTALL_PATH}"
    fi
    cd $APP_INSTALL_PATH
   

    # exstract archive 
    tar -xf $APP_ARCHIVE_PATH

    fillMySettings $APP_ARCHIVE_PATH $APP_INSTALL_PATH ${APP_INSTALL_PATH}progC

}


function install(){
    APP_ARCHIVE_PATH=$1
    APP_INSTALL_PATH=$2
    unpacking $APP_ARCHIVE_PATH $APP_INSTALL_PATH
    cd ${APP_INSTALL_PATH}progC
    gcc -o ./check.txt  main.c
}

function reinstall(){
    APP_ARCHIVE_PATH=$1
    APP_INSTALL_PATH=$2
    unpacking $APP_ARCHIVE_PATH $APP_INSTALL_PATH
    cd ${APP_INSTALL_PATH}progC
    gcc -o ./check.txt  main.c
}

function remove(){
    local APP_PATH=$1
    if [ -d "${APP_PATH}" ]; then
        rm -r "${APP_PATH:?}"
        return 0
    else
        echo "Error"
        return 1
    fi
}

# $1 - CHOISE
# $2 - ARCHIVE_PATH
# $3 - PROJECT_PATH


#update_settings
case "$1" in 
1)  ARCHIVE_PATH=$2
    if [ $# -eq 3 ];
        then
            install $ARCHIVE_PATH $3
        else 
            install $ARCHIVE_PATH ${HOME}/Documents/
    fi
    ;;
2)  PROJECT_PATH=$2
    remove $PROJECT_PATH
    ;;
3)  ARCHIVE_PATH=$2
    PROJECT_PATH=$3
    reinstall $ARCHIVE_PATH $PROJECT_PATH
    ;;
4)  exit 0
    ;;
*)  echo "$1 is not an option" 
    ;;
   esac
