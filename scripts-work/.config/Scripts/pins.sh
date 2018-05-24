# simple pin system
pinfile=$HOME/.pins
alias pl='if [ -f $pinfile ]; then
            while read -r pin; do
              key=`awk -F "\t" '"'"'{print $1}'"'"' <<< $pin`
              folder=`awk -F "\t" '"'"'{print $2}'"'"' <<< $pin`
              echo -e "$key\t-- $folder"
            done < $pinfile
          fi'
pa() {
  if [ "$1" != "" ] && ([ ! -f $pinfile ] || ! grep -Pq "^$1\t" $pinfile); then
    touch $pinfile
    echo -e "$1\t$PWD" >> $pinfile
    pl
  fi
}
pd() {
  if [ "$1" != "" ] && grep -Pq "^$1\t" $pinfile; then
    sed -i "/^$1\t/d" "$pinfile"
    pl
  fi
}
pg() {
  if [ "$1" != "" ] && grep -Pq "^$1\t" $pinfile; then
    cd `sed "s/^$1\t\(.*\)$/\1/;t;d" $pinfile`
    ls
  fi
}
_complete_pins_zsh() {
  local all_aliases=()
  while IFS= read -r line; do
    all_aliases+=("$line")
  done <<< "$(sed -e 's/\t/:/g' $pinfile 2>/dev/null)"

  _describe -t aliases 'pinned aliases:' all_aliases && return 0
}
compdef _complete_pins_zsh pg
compdef _complete_pins_zsh pd
