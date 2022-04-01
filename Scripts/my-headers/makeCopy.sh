#!/usr/bin/env bash

# Copy all * .h files to `my-headers` directory.
#Provide an ability to use different options:

#a) ./makeCopy - run in current folder and copy to myheader folder (default)
function makeCopyToMyheader(){
    NAME_DIRECTORY="my-headers"
        for file in *.*
        do
            if [ -e "$file" ]; 
            then
                if [ ! -d "$NAME_DIRECTORY" ];
                    then mkdir $NAME_DIRECTORY
                fi
            cp *.* $NAME_DIRECTORY
            break
            fi
        done
}

#b) ./makeCopy -d dir_name - run in current follder and copy to dir_name folder
function makeCopyToDirName(){
   if [ ! -d "$1" ];
        then mkdir $1
        fi

        # copy folder to BackUps directory:
        cp -R `pwd` $1
echo $1
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
echo $1
}

#e) ./makeCopy -l dir_name - run in dir_name folder and copy to myheader folder
function runInDirNameAndCopyToMyHeader(){
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
        for (( i=0; i < ${length}; i++ ))
        do
            case "${array[$i]}" in 

            -d) #./makeCopy -d dir_name - run in current follder and copy to dir_name folder
                makeCopyToDirName ${array[$((i+1))]}
                ((i=i+1))
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
