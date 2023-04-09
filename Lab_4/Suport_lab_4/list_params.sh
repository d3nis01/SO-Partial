#!/bin/bash
### Afișează lista parametrilor cu care este apelat. ###

i=0
while test $i -lt $#
do
  let i+=1
  echo param_$i = ${!i}
done

#exemplu input : ./list-params are andrei si mere si pere