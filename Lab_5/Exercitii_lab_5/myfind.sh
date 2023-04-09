#!/bin/bash

if [ -z "$1" ]
then
    read -p "Introduceti directorul de pornire:" dir
else
    dir=$1
fi

prog_files=0
recent_accessed_files=0
subdirs=0

count_files() {
    for file in "$1"/*
    do
        if [ -f "$file" ]
        then
            if file "$file" | grep -q "Bourne-Again shell script"
            then
                ((prog_files++))
                echo $file

            fi

            if [ $(stat -c %X "$file") -ge $(date -d '30 days ago' +%s) ]
            then
                ((recent_accessed_files++))
            fi
        elif [ -d "$file" ]
        then
            ((subdirs++))
            count_files "$file"
        fi
    done
}

count_files "$dir"

echo "Numarul total de fisiere de program in directorul $dir: $prog_files"
echo "Numarul total de fisiere accesate in ultimele 30 de zile in directorul $dir: $recent_accessed_files"
echo "Numarul total de subdirectoare in directorul $dir: $subdirs"