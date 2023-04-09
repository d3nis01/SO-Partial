#!/bin/bash
### Calculator aritmetic ###

if [ $# -eq 1 ] ; then
    fisier=$1
else
    echo -n "Dati numele fisierului: " ; read fisier
fi

nr_op=0

truncate -s 0 $fisier # sterge tot din $fisier, alocand fisierului 0 octeti

while true
do
    read -p "Dati operatorul: " op
    [ $op = "q" ] && break

    read -p "Dati primul operand: " nr1
    read -p "Dati al doilea operand: " nr2

    case "$op" in
        "+"  ) let rez=nr1+nr2 ;;
        "-"  ) let rez=nr1-nr2 ;;
        "*"  ) let rez=nr1*nr2 ;;
        "/"  ) let rez1=nr1/nr2                    # câtul împărțirii întregi
               rez2=$(echo "$nr1 / $nr2" | bc -l)  # câtul împărțirii reale
               #functia bc trebuie sa primeasca ca parametru un string cu elementele despartite de un '/' si va returna impartirea reala
               rez="$rez1 (impartire intreaga) si $rez2 (impartire reala)" ;; 
        "%"  ) let rez=nr1%nr2 ;;
        "**" ) let rez=nr1**nr2 ;;
    esac
    let nr_op++
    echo "$nr_op:  $nr1 $op $nr2 = $rez" >> $fisier # >> - concateneaza o noua line la fisierul tau
done

echo "Numarul total de operatii efectuate: $nr_op" >> $fisier