# simple task system
taskfile=$HOME/.tasks
alias tl='if [ -f $taskfile ]; then
            count=1
            while read -r task; do
              echo -e "$count:-- $task"
              (( count++ ))
            done < $taskfile | column -t -s :
          fi'

ta() {
  if [ "$1" != "" ]; then
    touch $taskfile
    echo -e "$@" >> $taskfile
    tl
  fi
}

td() {
  if [ "$1" -le "$(wc -l < $taskfile)" ]; then
    sed -i "$1d" "$taskfile"
    tl
  fi
}

_complete_goto_bash() {
  local cur="${COMP_WORDS[$COMP_CWORD]}" prev

  if [ "$COMP_CWORD" -eq "1" ]; then
    local width=$(bind -v | sed -n 's/^set completion-display-width //p')

    if [[ $width -ne 0 ]]; then
        # change the readline variable
        bind "set completion-display-width 0"

        # set up PROMPT_COMMAND to reset itself to its current value
        PROMPT_COMMAND="PROMPT_COMMAND=$(printf %q "$PROMPT_COMMAND")"

        # set up PROMPT_COMMAND to reset the readline variable
        PROMPT_COMMAND+="; bind 'set completion-display-width $width'"
    fi

    local IFS=$'\n' matches

    matches=($(sed = $taskfile|sed 'N;s/\n/:/'|sed '/'"$cur"'[0-9]*/!d' 2>/dev/null))

    compopt +o filenames 2>/dev/null
    if [ "${#matches[@]}" -eq "1" ]; then
      COMPREPLY=("${matches[0]%%$':'*}")
    else
      for i in "${!matches[@]}"; do
        COMPREPLY+=("$(compgen -W "${matches[$i]%%$'\t'*}")")
      done
    fi
    IFS=$'\n' COMPREPLY=($(printf "%s\n" "${COMPREPLY[@]}"|column -t -s :))
  fi
}

_complete_pins_zsh() {
  if [ ${#words[@]} -eq 2 ]; then
    local all_aliases=()
    while IFS= read -r line; do
      all_aliases+=("$line")
    done <<< "$(sed = $taskfile | sed 'N;s/\n/:/' 2>/dev/null)"

    _describe -t aliases 'pinned aliases:' all_aliases && return 0
  fi
}

if [ -n "${BASH_VERSION}" ]; then
  complete -F _complete_goto_bash td
elif [ -n "${ZSH_VERSION}" ]; then
  compdef _complete_pins_zsh td
fi
