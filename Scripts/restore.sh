#!/usr/bin/env bash

ARCHIVE_FULL=$1
ARCHIVE_NAME=$(cut -d "=" -f2- <<< $1)
echo $ARCHIVE_NAME

