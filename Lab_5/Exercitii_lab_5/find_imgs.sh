#!/bin/bash

#Să se scrie un script care să construiască o pagină web cu link-uri HTML către toate fișierele imagini (i.e., cele cu extensiile .jpg, .gif, 
# .png, ș.a.) din contul personal de pe server, ordonate după data ultimei modificări a fișierelor.
#(Indicație: aveți grijă la drepturi pentru vizibilitatea pe web a paginii construite, similar ca la exercițiul precedent.)

if [ $# -eq 0 ]
then
    dir=$HOME
else
    dir=$1
fi

images=$(find "$dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -printf '%T@ %p\n' | sort -n -r | cut -f2- -d" ")

htmlFile="$HOME/html/images.html"

echo "<html><head><title>Imagini</title></head><body>" > "$htmlFile"

for img in $images; do
    fileName=$(basename "$img")
    name="${fileName%.*}"
    echo "<a href=\"$img\">$name</a><br>" >> "$htmlFile"
done

echo "</body></html>" >> "$htmlFile"