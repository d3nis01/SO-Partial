#!/bin/bash
### Cele mai multe apariții într-o secvență de numere dată. ###

declare -a v   # declara v ca fiind un array

if [ $# -eq 0 ]
then
    read -p "Dati numarul de numere: "  nr
    for i in $(seq 1 $nr)
    do
	    read -p "Dati v[$i]: "  v[$i]
    done
else
    nr=$#
    for i in $(seq 1 $nr)
    do
	    v[$i]=$1
	    shift #shift schimba $2 in $1, $3 in $2, $4 in $3..
        # shifteaza parametrii la stanga
    done
fi

declare -a ap    # declara ap ca fiind un array

for i in $(seq 1 $nr)
do
    ap[$i]=0
done

for i in $(seq 1 $nr)
do
    for j in `seq 1 $nr`
    do
	if [ ${v[i]} -eq ${v[j]} ]
	then
	    let ap[$i]+=1
	fi
    done
done

max=${ap[1]}
index=1

for i in $(seq 2 $nr)
do
    if [ $max -lt ${ap[$i]} ]
    then
	    max=${ap[$i]}
	    index=$i
    fi
done

echo "Numarul cu cele mai multe aparitii este ${v[$index]} si are ${ap[$index]} aparitii."
