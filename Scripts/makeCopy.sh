#!/usr/bin/env bash

# Copy all * .h files to `my-headers` directory.
#Provide an ability to use different options:
#a) ./makeCopy - run in current folder and copy to myheader folder (default)
#b) ./makeCopy -d dir_name - run in current follder and copy to dir_name folder
#c) ./makeCopy -e cpp - run in current folder and copy to myheader folder all .cpp files
#d) ./makeCopy -e cpp -d dir_name - run in current folder and copy to dir_name folder all .cpp files
#e) ./makeCopy -l dir_name - run in dir_name folder and copy to myheader folder
NAME_DIRECTORY="my-headers"
for h_file in *.h
do
    if [ -e "$h_file" ]; then
        if [ ! -d "$NAME_DIRECTORY" ];
        then mkdir $NAME_DIRECTORY
        fi
        cp *.h $NAME_DIRECTORY
        break
    fi
done