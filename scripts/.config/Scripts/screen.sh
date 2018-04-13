#!/bin/bash

showusage() {
  echo "Usage:"
  echo "  screen.sh [options] main-display"
  echo ""
  echo "Options:"
  echo "  -l <display>  Display to be used to the left of main-display"
  echo "  -r <display>  Display to be used to the right of main-display"
  echo "  -h            Show this screen."
}

disablerest() {
  xrandr -q|grep '\bconnected\b'|cut -d' ' -f1|while read line; do
    if [[ ("$line" != "$middle") && ("$line" != "$left") && ("$line" != "$right") ]]; then
      cmd="$cmd --output $line --off"
    fi
  done
}

while getopts "l:r:h" opt; do
  case ${opt} in
    l )
      left="$OPTARG"
      ;;
    r )
      right="$OPTARG"
      ;;
    h )
      showusage
      exit 0
      ;;
    \? )
      echo "Invalid Option: -$OPTARG" 1>&2
      showusage
      exit 1
      ;;
  esac
done
shift $((OPTIND - 1))

middle="$1"
cmd="xrandr "

if [[ ("$middle" != "") && ($(xrandr -q |grep $middle\ con)) ]]; then
  cmd="$cmd --output $middle --auto"

  if [[ ("$left" != "") && ($(xrandr -q |grep $left\ con)) ]]; then
    cmd="$cmd --output $left --auto --left-of $middle"
  fi

  if [[ ("$right" != "") && ($(xrandr -q |grep $right\ con)) ]]; then
    cmd="$cmd --output $right --auto --right-of $middle"
  fi

  disablerest
else
  echo "Falling back to only laptop display" 1>&2

  disablerest

  if [[ ("$left" != "") && ($(xrandr -q |grep $left\ con)) ]]; then
    cmd="$cmd --output $left --off"
  fi

  if [[ ("$right" != "") && ($(xrandr -q |grep $right\ con)) ]]; then
    cmd="$cmd --output $right --off"
  fi

  cmd="$cmd --output LVDS-1 --auto"
fi

eval $cmd

~/.config/polybar/launch.sh
feh --bg-scale ~/.config/wall
