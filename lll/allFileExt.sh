#!/usr/bin/env bash

#A script, printing all file extensions in the directory without repeating.

for i in *.*; do echo "${i##*.}"; done | sort -u