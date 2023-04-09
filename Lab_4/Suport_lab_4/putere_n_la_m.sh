#!/bin/bash

if [ $# -ge 1 ]; then
    n=$1
else
    read -p "Introduceti n: " n
fi

if [ $# -ge 2 ]; then
    m=$2
else
    read -p "Introduceti m: " m
fi

eputere="Adevarat"

function putere()
{
    if [ $1 -gt 1 ]
    then
        let rest=$1%$2
        if [ $rest -gt 0 ]; then
            eputere="Fals"
        fi
        let div=$1/$2
        putere $div $2
    fi
}

putere $n $m
echo Rezultat final: $eputere