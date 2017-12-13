#!/bin/bash

repo="/home/micah/git/dotfiles/"
files="./files"
oldfiles="./oldfiles"
echo "" > $oldfiles

while read file
do
  if [[ $file != "" && $file != \#* ]]; then
    if [ ! -L ~/$file ]; then
      if [ -e ~/$file ]; then
        echo ""
        echo "~/$file >> ~/$file-old"
        echo "~/$file-old" >> $oldfiles
        mv ~/$file ~/$file-old
      fi
      echo "$repo$file >> ~/$file"
      ln -s $repo$file ~/$file
    fi
  fi
done < $files
