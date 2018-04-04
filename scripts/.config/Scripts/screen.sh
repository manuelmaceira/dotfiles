#!/bin/bash

while getopts "l:r:h" opt; do
  case ${opt} in
    l )
      left="$OPTARG"
      ;;
    r )
      right="$OPTARG"
      ;;
    h )
      echo "Usage:"
      exit 0
      ;;
    \? )
      echo "Invalid Option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND - 1))

middle="$1"

if [[ ("$middle" != "") && ($(xrandr -q |grep $middle\ con)) ]]; then
  xrandr --output $middle --auto
else
  echo "Falling back to only laptop display" 1>&2
  xrandr --output LVDS-1 --auto
  xrandr --output $left --off
  xrandr --output $right --off

  ~/.config/polybar/launch.sh
  feh --bg-scale ~/.config/wall

  exit 0
fi

if [[ ("$left" != "") && ($(xrandr -q |grep $left\ con)) ]]; then
  xrandr --output $left --auto --left-of $middle
fi

if [[ ("$right" != "") && ($(xrandr -q |grep $right\ con)) ]]; then
  xrandr --output $right --auto --right-of $middle
fi

xrandr -q|grep '\bconnected\b'|cut -d' ' -f1|while read line; do
  if [[ ("$line" != "$middle") && ("$line" != "$left") && ("$line" != "$right") ]]; then
    xrandr --output $line --off
  fi
done

~/.config/polybar/launch.sh
feh --bg-scale ~/.config/wall
