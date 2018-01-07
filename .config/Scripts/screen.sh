#!/bin/bash

dual() {
  if [[ ($(xrandr -q | grep VGA1\ con)) && ($(xrandr -q | grep HDMI1\ con)) ]]; then
    xrandr --output VGA1 --auto --output HDMI1 --auto --right-of VGA1 --output eDP1 --off
  fi
}

vga() {
  xrandr --output VGA1 --auto --output eDP1 --off  --output HDMI1 --off
}

hdmi() {
  xrandr --output HDMI1 --auto --output eDP1 --off  --output VGA1 --off
}

laptop() {
  xrandr --output eDP1 --auto --output VGA1 --off  --output HDMI1 --off
}

case $1 in
  d) dual ;;
  v) vga ;;
  h) hdmi ;;
  l) laptop ;;
  *) echo "Invalid parameter"
esac
