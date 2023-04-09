#!/bin/bash
### Calcul iterativ demonstrativ: adunări repetate. ###
#calculeaza n * m = n + n + ... + n

if [ $# -lt 1 ]
then
    echo -n "Introduceti primul numar: "
    read n
else
    n=$1
fi

if [ $# -lt 2 ]
then
    read -p "Introduceti al doilea numar: " m
else
    m=$2
fi

prod=0
for i in `seq 1 $m`
do
    let prod=prod+$n
done

echo "Rezultatul operatiei $n * $m este: $prod"