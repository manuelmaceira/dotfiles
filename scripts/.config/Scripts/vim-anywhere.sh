#!/bin/bash

function setclip {
  xclip -selection c
}

function getclip {
  xclip -selection clipboard -o
}

file=$(mktemp).md
urxvt -e /home/micah/.config/i3/scripts/runner "nvim '$file'" # replace with your favorite terminal

cat $file | setclip
rm $file

xdotool key ctrl+v
