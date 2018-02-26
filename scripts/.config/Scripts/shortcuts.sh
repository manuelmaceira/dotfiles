#!/bin/bash

# Config locations
folders="$HOME/.config/Scripts/folders"
configs="$HOME/.config/Scripts/configs"

# Output locations
zsh_shortcuts="$HOME/.zsh_shortcuts"
ranger_shortcuts="$HOME/.config/ranger/shortcuts.conf"

#Delete old shortcuts
echo "# vim: filetype=sh" > $zsh_shortcuts
echo "# ranger shortcuts" > $ranger_shortcuts

writeDirs() {
  echo "alias $1='cd $2 && ls'" >> $zsh_shortcuts
	echo "map g$1 cd $2" >> $ranger_shortcuts
	echo "map t$1 tab_new $2" >> $ranger_shortcuts
	echo "map m$1 shell mv %s $2" >> $ranger_shortcuts
	echo "map Y$1 shell cp -r %s $2" >> $ranger_shortcuts
}

writeConfs() {
	echo "alias $1='nvim $2'" >> $zsh_shortcuts
	echo "map $1 shell nvim $2" >> $ranger_shortcuts
}

IFS=$'\n'
set -f
for line in $(cat "$folders"); do
	line=$(echo $line | sed 's/#.*//')
	key=$(echo $line | awk '{print $1}')
	dir=$(echo $line | awk '{print $2}')
	[ "$dir" == "" ] || writeDirs $key $dir
done

set -f
for line in $(cat "$configs");
do
	line=$(echo $line | sed 's/#.*//')
	short=$(echo $line | awk '{print $1}')
	conf=$(echo $line | awk '{print $2}')
	[ "$conf" == "" ] || writeConfs $short $conf
done
