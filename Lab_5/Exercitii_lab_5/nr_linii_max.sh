#!/bin/bash

# Să se scrie un script care calculează numărul total de cuvinte și respectiv lungimea cea mai mare a liniilor de text, din toate fișierele ce 
# conțin text obișnuit (i.e., fișierele pentru care comanda file raportează "ASCII text") aflate într-un director dat, parcurgand acel director 
# în manieră recursivă, în mod explicit (i.e., fără a apela comanda find sau comanda ls -R). Numele directorului se transmite ca parametru în 
# linia de comandă, sau se va citi prin comanda read în caz contrar.

if [ $# -eq 0 ]
then
    read -p "Dati numele directorului de start: " numedir
    [ -z $numedir ] && numedir="."   # Dacă utilizatorul introduce cuvântul vid la read (i.e., apasă direct ENTER), vom procesa directorul curent de lucru!
else
    numedir=$1
fi

function parcurgere_director ()
{
    # echo "$1"
    for fis in $(ls -A $1)
    do
        # echo "$fis"
            # Construim calea până la intrarea $fis din directorul $1
        cale=$1/$fis   # Este suficient doar atât, căci argumentul primului apel nu va putea fi cuvântul vid niciodată! (Motivul: a se vedea primul if din script)
        # echo "$(file $cale)"

        if [ -r $cale ] ; then
            if file $cale | grep -q "ASCII text" ; then
                # echo " > Fisierul $fis are $(wc -w $fis)"
                echo " > Fisierul $fis are $(wc -w $cale | cut -d" " -f1) cuvinte"
            fi

            if [ -d $cale ] ; then
                parcurgere_director $cale
            fi
        fi
    done
}

echo "$1"
parcurgere_director "$1"