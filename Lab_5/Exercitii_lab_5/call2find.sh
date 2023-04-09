#!/bin/bash

if [ $# -eq 0 ] ; then
    echo "Nu ati dat director"
    exit 1
fi

fisiere=$(find "$1" -type f)
# echo "$fisiere"
for fisier in $fisiere/*
do
    if file "$fisier" | grep -q "Bourne-Again shell script"
    then
        # echo $(file $fisier)
        echo "$fisier"
    fi
done