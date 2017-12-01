#!/bin/bash

repo="/home/micah/git/dotfiles/"
files="./files"

while read file
do
    filepath=`dirname $file|cut -d'/' -f2-`
    filename=`basename "$file"`
    if eval "test -e $file"; then
        if [[ $filepath != "~" ]]; then
            filepath=$filepath/
            mkdir -p $repo$filepath
        else
            filepath=""
        fi
        if eval "test -f $file"; then
            eval "rsync $file $repo$filepath$filename"
        elif eval "test -d $file"; then
            eval "rsync -r $file/ $repo$filepath$filename --delete"
        fi
    fi
done < $files
