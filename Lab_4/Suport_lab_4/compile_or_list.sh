#!/bin/bash

#Să se scrie un script care primește ca parametru un nume de director. Scriptul va compila fiecare fișier sursă C aflat în directorul dat,
#respectiv va tipări (i.e., afișa pe ecran) conținutul fiecărui fișier text din acest director.
#(Compilarea se va realiza în felul următor:   gcc fisier.c -o fisier -Wall .)

function compilare()
{
    output=${1%.c}    # sau, echivalent, dar mai puțin performant:  output=$(dirname $1)/$(basename $1 .c)    
    # exemplu $1 va fi fisier.c => output va fi "fisier"
    gcc $1 -o $output -Wall     # functia de compilare a unui fisier C
}

function afisare()
{
    echo "Continutul fisierului $1 este:"
    cat $1
}

# Validarea datelor de intrare

if [ $# -eq 0 ]
then
    echo "Utilizare: $0 director"
    exit 1  # Fail!
fi

if [ ! -d $1 -o ! -r $1  ] # daca fisierul nu este director sau nu avem drept de read asupra lui este eroare
then
    echo "Eroare: Primul argument, $1, nu este director, sau nu aveti drept de citire a acestuia!"
    exit 2  # Fail!
fi

# Procesarea fisierelor din directorul primit ca argument

# $(ls -A $1) - functia returneaza path-ul tutoror fisierelor din folderul $1 (inclusiv recursiv, adica folderele din folder)
# -A se refera la fisierele care nu sunt ascunse.

for f in $(ls -A $1)
do
    case $f in
      *.c   ) echo "fisier sursa C: $1/$f" ; compilare $1/$f ;;
      *.txt ) echo "fisier text: $1/$f"    ; afisare $1/$f ;;
    esac
done

exit 0  # Succes!