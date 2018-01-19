#!/bin/bash

left='HDMI-3'
right='HDMI-2'
laptop='LVDS-1'

dual() {
  if [[ ($(xrandr -q | grep $left\ con)) && ($(xrandr -q | grep $right\ con)) ]]; then
    xrandr --output $left --auto --output $right --auto --right-of $left --output $laptop --off
  fi
}

left() {
  if [[ $(xrandr -q | grep $left\ con) ]]; then
    xrandr --output $left --auto --output $laptop --off  --output $right --off
  fi
}

right() {
  if [[ $(xrandr -q | grep $right\ con) ]]; then
    xrandr --output $right --auto --output $laptop --off  --output $left --off
  fi
}

laptop() {
  xrandr --output $laptop --auto --output $left --off  --output $right --off
}

case $1 in
  d) dual ;;
  l) left ;;
  r) right ;;
  s) laptop ;;
  *) echo "Invalid parameter"
esac

~/.config/polybar/launch.sh
feh --bg-scale ~/.config/wall
