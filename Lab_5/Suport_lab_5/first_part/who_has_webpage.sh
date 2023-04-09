#!/bin/bash
### Testing who has webpage? ###
# Să se scrie un script care să afișeze care dintre utilizatorii ce sunt studenți și al căror nume de cont începe cu o literă dată, au pagini web pe serverul students.

if [ $# -eq 0 ]
then
    read -p "Dati prima litera a numelor: " litera
else
    litera=$1
fi

lista=$(grep :202: /etc/passwd | grep ^$litera | cut -f1 -d:) # ^ - Matches characters at the beginning of a line
# ^$litera - se refera ca primul caracter e acea litera

for user in $lista
do
    dir_html_user=~$user/html     # i.e. dir_html_user=/fenrir/studs/$user/html

    if test -r $dir_html_user/index.html -o -r $dir_html_user/index.htm -o -r $dir_html_user/index.php
    then
        echo $user are pagina web "(accesibila la adresa https://students.info.uaic.ro/~"$user" )."
    fi
done
