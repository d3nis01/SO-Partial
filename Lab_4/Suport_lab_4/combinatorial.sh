#!/bin/bash
### Calculează combinări de n luate câte k. ###

if [ $# -lt 1 ]
then
    echo -n "Dati numarul n: " ; read n
else
    n=$1
fi

if [ $# -lt 2 ]
then
    read -p "Dati numarul k: " k
else
    k=$2
fi

if [ $n -lt $k ]
then
    echo "Eroare: $n este mai mic decat $k. Calcul imposibil!"
    exit 1
fi


function fact ()
{
    prod=1
    for i in $(seq 1 $1)
    do
        let prod=prod*i
    done
    echo $prod
}

# Urmeaza calculul pe baza formulei C(n,k) = n! / (k!*(n-k)!)

#calcul factorial $n
nfact=$(fact $n)
echo "factorial de $n este $nfact" 1>&2         # mesaj de depanare, afisat pe stderr

#calcul factorial $k
kfact=`fact $k`
echo "factorial de $k este $kfact" 1>&2         # mesaj de depanare, afisat pe stderr

let n_k=$n-$k
echo "$n-$k este $n_k" 1>&2                     # mesaj de depanare, afisat pe stderr

#calcul factorial $n_k
n_kfact=`fact $n_k`
echo "factorial de $n_k este $n_kfact" 1>&2     # mesaj de depanare, afisat pe stderr

numitor=$(expr $kfact \* $n_kfact)
combinatorial=`expr $nfact / $numitor`
echo "Rezultatul este C($n,$k)=$combinatorial"
