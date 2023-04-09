#!/bin/bash
### My id command. ###

if [ $# -eq 0 ]
then
    echo "Eroare: parametri insuficienti! Nu ati specificat UID-ul."
    exit 1  # Fail!
fi

cuv=":$1:"
linie=`grep $cuv /etc/passwd`
if [ $? -eq 0 ]
then
    nume_real=`echo $linie | cut -d: -f5 | cut -d, -f1`
    if [ -n "$nume_real" ] ; then echo Numele real: $nume_real ; else echo "Nu exista informatii despre numele real." ; fi
	
    nume_cont=`echo $linie | cut -d: -f1`
    echo Numele de cont: $nume_cont

    echo -n Grupurile din care face parte:
    id -Gn $nume_cont
else
    echo "Eroare: nu exista nici un utilizator avand $1 drept UID."
    exit 2  # Fail!
fi

exit 0  # Succes!