#!/usr/bin/env bash

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