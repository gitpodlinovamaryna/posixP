#!/usr/bin/env bash

# Find the first 20 occurrences of the word `_asm` in *.c files.
WORD="_asm"
COUNT=0
CHECK=20

for file in *.c
do
 COUNT=$(( COUNT+$(grep -c $WORD "$file") ))


echo "$COUNT"
done
