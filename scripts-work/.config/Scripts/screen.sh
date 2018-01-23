#!/bin/bash

left='DVI-0'
right='DVI-1'

dual() {
  if [[ ($(xrandr -q | grep $left\ con)) && ($(xrandr -q | grep $right\ con)) ]]; then
    xrandr --output $left --auto --output $right --auto --right-of $left
  fi
}

vga() {
  xrandr --output $left --auto --output $right --off
}

hdmi() {
  xrandr --output $right --auto --output $left --off
}

case $1 in
  d) dual ;;
  v) vga ;;
  h) hdmi ;;
  *) echo "Invalid parameter"
esac

~/.config/polybar/launch.sh
