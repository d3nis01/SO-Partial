#!/bin/bash
### Calculează minimul și maximul unei secvențe de numere. ###

if [ $# -eq 0 ]
then
    read -p "Dati lungimea secventei de numere: " n
    read -p "Dati primul numar din secventa: " k
    max=$k
    min=$k

    i=2
    while [ $i -le $n ]
    do
        read -p "Dati al $i-lea numar din secventa: " k
        if [ $k -lt $min ] ; then min=$k ; fi
        if [ $k -gt $max ] ; then max=$k ; fi

        let i++
    done
else
    min=$1
    max=$1

    shift #shift schimba $2 in $1, $3 in $2, $4 in $3..
    # shifteaza parametrii la stanga
    for p in $@
    do
        if [ $p -lt $min ] ; then min=$p ; fi
        if [ $p -gt $max ] ; then max=$p ; fi
    done
fi

echo "Minimul secventei de numere date este: $min , iar maximul ei este: $max ."
