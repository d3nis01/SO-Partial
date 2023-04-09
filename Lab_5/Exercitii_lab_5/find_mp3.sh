#!/bin/bash

if [ -z "$1" ]; then
    directory=~
else
    directory="$1"
fi

if [ ! -d ~/html/muzica ]; then
    mkdir -p ~/html/muzica
fi

find "$directory" -type f -iname "*.mp3" | while read file; do
    filename=$(basename "$file" .mp3)
    ln -f "$file" ~/html/muzica/"$filename".mp3
done

playlist=~/html/playlist.html
echo "<html><head><title>Playlist MP3</title></head><body><ul>" > "$playlist"
find ~/html/muzica -type f -iname "*.mp3" | while read file; do
    filename=$(basename "$file" .mp3)
    echo "<li><a href=\"muzica/$(basename "$file")\">$filename</a></li>" >> "$playlist"
done
echo "</ul></body></html>" >> "$playlist"

chmod -R o+x "$HOME" ~/html ~/html/muzica
chmod -R o+r ~/html/playlist.html