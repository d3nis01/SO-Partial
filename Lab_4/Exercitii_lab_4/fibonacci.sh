#!/bin/bash

function fibo()
{
    if (( $1 == 0 )) ; then
        echo 0
    elif (( $1 == 1 )) ; then
        echo 1
    elif (( $1 == 2 )) ; then
        echo 1
    else
    echo $(( $(fibo $1-1) + $(fibo $1-2) ))
    fi
}
echo "da n"
read n
fibo $n
