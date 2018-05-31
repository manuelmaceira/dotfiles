# simple pin system
pinfile=$HOME/.pins
alias pl='if [ -f $pinfile ]; then
            while read -r pin; do
              key=`awk -F "\t" '"'"'{print $1}'"'"' <<< $pin`
              folder=`awk -F "\t" '"'"'{print $2}'"'"' <<< $pin`
              echo -e "$key:-- $folder"
            done < $pinfile | column -t -s :
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

_complete_pins_bash() {
  local cur="${COMP_WORDS[$COMP_CWORD]}" prev

  if [ "$COMP_CWORD" -eq "1" ]; then
    local IFS=$'\n' matches

    matches=($(sed -n "/^$cur/p" "$pinfile" 2>/dev/null))

    compopt +o filenames 2>/dev/null
    if [ "${#matches[@]}" -eq "1" ]; then
      COMPREPLY=("${matches[0]%%$'\t'*}")
    else
      for i in "${!matches[@]}"; do
        COMPREPLY+=("$(compgen -W "${matches[$i]%%$'\t'*}")")
      done
    fi
  fi
}

_complete_pins_zsh() {
  local all_aliases=()
  while IFS= read -r line; do
    all_aliases+=("$line")
  done <<< "$(sed -e 's/\t/:/g' $pinfile 2>/dev/null)"

  _describe -t aliases 'pinned aliases:' all_aliases && return 0
}

if [ -n "${BASH_VERSION}" ]; then
  complete -F _complete_pins_bash pg
  complete -F _complete_pins_bash pd
elif [ -n "${ZSH_VERSION}" ]; then
  compdef _complete_pins_zsh pg
  compdef _complete_pins_zsh pd
fi
