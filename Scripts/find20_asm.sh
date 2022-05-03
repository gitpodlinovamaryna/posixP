#!/usr/bin/env bash

# $1 - This is seaching directory
# $2 - This is options: 1 - Find total occurrences in seaching directory;
#                       2 - Print of founded words and break if found 20 words;

    
# Find the first 20 occurrences of the word `_asm` in *.c files.
function find20(){
    WORD="_asm"
    COUNT=0
    SEACHING_DIR=$1
#grep -rl '_asm' $1

    case "$2" in 
    1)  for file in "${SEACHING_DIR}"/*.c
        do 
            FILE_WITH_ASM=$(grep "${WORD}" "${file}")
            echo "Total _asm in file ${file}: "  $(grep "${WORD}" "${file}" | wc -l)
            ((COUNT+=$(grep "${WORD}" "${file}" | wc -l)))
        done
        echo "Total asm in the folder: "$COUNT
        ;;
    2)  for file in "${SEACHING_DIR}"/*.c
        do 
            FILE_WITH_ASM=$(grep "${WORD}" "${file}")
            while read -r line; do
                RESULT_IN_LINE=$(grep -o "${WORD}" <<< "${line}" | wc -l)
                echo $(grep  "${WORD}" <<< "${line}")
                echo $RESULT_IN_LINE
                ((COUNT+=RESULT_IN_LINE))
                if [ $COUNT -eq 20 ];
                    then echo "We found 20 occurrences!!!"
                    break
                fi
            done <<<"${FILE_WITH_ASM}"
        done
        ;;
    *)  echo "$2 is not an option" 
        ;;
    esac

}

find20 $1 $2
