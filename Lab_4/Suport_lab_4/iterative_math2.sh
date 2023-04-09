#!/bin/bash
### Calculează media artimetică a unei secvențe de numere. ###

ma=0

# pentru functia test se folosesc comparatiile -eq -tl etc.
# parantezele [] contin functia test deja
# deci scriem ca mai jos ori [$# -eq 0]

if test $# -eq 0
then
    read -p "Dati lungimea secventei de numere: " n
    for i in $(seq 1 $n)
    do
        read -p "Dati al $i-lea numar: " nr
        ma=$(echo $ma+$nr | bc)
    done
else
    n=$#
    for p in $@
    do
        ma=$(echo $ma+$p | bc)
    done
fi

echo -n "Media aritmetica a numerelor date este: "
echo "$ma/$n" | bc -l           # Se afișează rezultatul, cu 20 de zecimale

# Sau, dacă dorim, de exemplu, să se afișeze doar 5 zecimale, mai putem scrie:
echo "scale=5 ; $ma/$n" | bc    # Se afișează rezultatul, cu 5 zecimale
