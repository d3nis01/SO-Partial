#!/bin/bash
### Să se scrie un script care primește o secvență de n numere, plus un număr prim p citit de la tastatură, ###
###și efectuează calculul iterativ al sumei cuburilor acelor numere din secvența primită, numere ce sunt divizibile cu p.###
function cub()
{
    n=$1
    echo $(($n*$n*$n))
}

function estePrim()
{
    if (( $1 == 1 )) ; then
        echo 0 #"Numarul nu este prim"
    elif (( $1 == 2 )) ; then
        echo 1 #"Numarul este prim"
    else
        for i in $(seq 2 $(($1-1)))
        do
            if (( $1 % i==0 )) ; then
                echo 0 #"Numarul nu este prim"
                exit
            fi
        done
    fi
echo 1 #"Numarul e prim"
}

if ((! $(estePrim $1) )); then
    echo "numarul nu e prim"
    exit 1
fi

# read -p "Da nr prim" p
for i in $(seq 2 $#)
do
if ((${!i} % $1 == 0))
then 
    # sum=$(($(echo cub $i) + $sum))
    prod=$(cub ${!i})
    let sum=$prod+sum
fi  
done 
echo $sum
