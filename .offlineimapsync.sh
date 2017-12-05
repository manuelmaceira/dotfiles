#!/bin/bash

imapserver=$(cat ~/.offlineimaprc | grep remotehost | awk '{print $3}')
imapactive=$(ps -ef | grep '/usr/bin/[o]fflineimap' | wc -l)
netactive=$(ping -c3 $imapserver > /dev/null 2>&1 && echo up || echo down)
mailsync="/usr/bin/offlineimap -u quiet -q"

case $imapactive in
'1')
  #killall offlineimap && sleep 5
  echo "running"
;;
esac

case $netactive in
'up')
  echo "syncing"
  #$mailsync
;;
'down')
  :
;;
esac
