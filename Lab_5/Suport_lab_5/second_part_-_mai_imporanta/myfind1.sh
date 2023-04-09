#!/bin/bash
### Calculeaza recursiv numarul de fisiere fifo si subdirectoare dintr-un director dat. ###
### Afiseaza numarul total de fisiere fifo si subdirectoare continute de acesta.        ###
# nu se poate folosi comanda find in rezolvare
if [ $# -eq 0 ]
then
    read -p "Dati numele directorului de start: " numedir
    [ -z $numedir ] && numedir="."   # Dacă utilizatorul introduce cuvântul vid la read (i.e., apasă direct ENTER), vom procesa directorul curent de lucru!
else
    numedir=$1
fi

nr_fif=0
nr_dir=0

function parcurgere_director ()
{
    for fis in $(ls -A $1)
    do
        # Construim calea până la intrarea $fis din directorul $1
        cale=$1/$fis   # Este suficient doar atât, căci argumentul primului apel nu va putea fi cuvântul vid niciodată! (Motivul: a se vedea primul if din script)
		
        # Procesăm calea respectivă în funcție de tipul ei, i.e. subdirector/fișier fifo.
        if [ -d $cale ] ; then
            let nr_dir++
            parcurgere_director $cale    # apelul recursiv
        elif [ -p $cale ] ; then
            let nr_fif++
        fi
    done
}

parcurgere_director $numedir             # apelul initial

echo "Directorul $numedir contine $nr_dir directoare si $nr_fif fisiere fifo."
