#!/usr/bin/env bash

# Copy all * .h files to `my-headers` directory.
#Provide an ability to use different options:

#a) ./makeCopy - run in current folder and copy to myheader folder (default)
function makeCopyToMyheader(){
    NAME_DIRECTORY="my-headers"
        if [ ! -d "$NAME_DIRECTORY" ];
            then mkdir $NAME_DIRECTORY
        fi
        CDIR=$(pwd)
        for i in `ls`
        do
            if [ $i != "my-headers" ]
            then
                `cp -r $i $CDIR/$NAME_DIRECTORY`
            fi
        done
    #cp -a /$CDIR/. $NAME_DIRECTORY
}

#b) ./makeCopy -d dir_name - run in current follder and copy to dir_name folder
function makeCopyToDirName(){
    PATH_DIRECTORY=$1
    NAME_DIRECTORY=`basename "$1"`
    if [ ! -d "$PATH_DIRECTORY" ];
                    then mkdir $PATH_DIRECTORY
    fi
    CDIR=$(pwd)
        for i in `ls`
        do
            if [ $i != "$NAME_DIRECTORY" ]
            then
                `cp -r $i $PATH_DIRECTORY`
            fi
        done
}

#c) ./makeCopy -e cpp - run in current folder and copy to myheader folder all .cpp files
function makeCopyWithConditionToMyHeader(){
    NAME_DIRECTORY="my-headers"
        for ext_file in *.$1
        do
            if [ -e "$ext_file" ]; 
            then
                if [ ! -d "$NAME_DIRECTORY" ];
                    then mkdir $NAME_DIRECTORY
                fi
            cp *.$1 $NAME_DIRECTORY
            break
            fi
        done
}

#d) ./makeCopy -e cpp -d dir_name - run in current folder and copy to dir_name folder all .cpp files
function makeCopyWithConditionToDirName(){
    if [ $2 -eq "-d" ];
        then
        NAME_DIRECTORY=$3
        for ext_file in *.$1
        do
            if [ -e "$ext_file" ]; 
            then
                if [ ! -d "$NAME_DIRECTORY" ];
                    then mkdir $NAME_DIRECTORY
                fi
            cp *.$1 $NAME_DIRECTORY
            break
            fi;
        done
    else
        echo "$2 is not an option"
    fi;
}

#e) ./makeCopy -l dir_name - run in dir_name folder and copy to myheader folder
function runInDirNameAndCopyToMyHeader(){
    RUN_DIR=$1
    NAME_DIRECTORY="my-headers"
    if ! [ -d $RUN_DIR ]; then
        echo 'No directory'
    else
        cd $RUN_DIR
        if [ ! -d "$NAME_DIRECTORY" ];
            then mkdir $NAME_DIRECTORY
        fi
        CDIR=$(pwd)
        for i in `ls`
        do
            if [ $i != "my-headers" ]
            then
                `cp -r $i $CDIR/$NAME_DIRECTORY`
            fi
        done

    fi
echo $1
}

function makeCopyFunc(){
    local array
    array=("$@")
    length=${#array[@]}
    # Array Loop
    if [ $length -eq 0 ];
        then 
            makeCopyToMyheader
    else
        for (( i = 0; i < ((${length} - 1)); i++ ))
        do
            case "${array[$i]}" in 

            -d) #./makeCopy -d dir_name - run in current follder and copy to dir_name folder
                makeCopyToDirName ${array[$((i+1))]}
               # ((i++))
                ;;
            -e) # 1 - ./makeCopy -e cpp - run in current folder and copy to myheader folder all .cpp files
                # 2 - ./makeCopy -e cpp -d dir_name - run in current folder 
                #      and copy to dir_name folder all .cpp files
                if [ $length -eq 4 ];
                    then 
                        makeCopyWithConditionToDirName ${array[$((i+1))]} ${array[$((i+2))]} ${array[$((i+3))]}
                        ((i=i+3))
                else
                        makeCopyWithConditionToMyHeader ${array[$((i+1))]}
                        ((i=i+1))
                fi    
                ;;
            -l) #./makeCopy -l dir_name - run in dir_name folder and copy to myheader folder
                runInDirNameAndCopyToMyHeader ${array[$((i+1))]}
                ((i=i+1))
                ;;
            *)  echo "This is not an option" 
                ;;
            esac
        done
    fi
}

makeCopyFunc "$@"
