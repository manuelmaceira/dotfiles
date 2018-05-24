if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export DEFAULT_USER="micah"
export BROWSER="/home/micah/qutebrowser/bin/qutebrowser"
export LC_ALL=en_US.UTF-8
export GOROOT='/usr/local/go'
export GOPATH='/home/micah/go'

export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt interactivecomments
setopt CORRECT

source ~/.zsh_aliases
source ~/.zsh_shortcuts

# terminal vim
export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins '^a' vi-beginning-of-line
bindkey -M viins '^e' vi-end-of-line
bindkey -M viins '^k' kill-line
bindkey '^r' history-incremental-search-backward

# show which vim mode we are in
precmd() { RPROMPT="" }
zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="(COMMAND MODE)"
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() { typeset -g __prompt_status="$?" }
zle -N zle-keymap-select
zle -N zle-line-init

# completion selection by menu for kill
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' horse-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# tab completion for PIDs
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm,command -w -w"
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' horse-list always

# use caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

PATH="/home/micah/go/bin:/usr/local/go/bin:/home/micah/.npm-global/:/home/micah/qutebrowser/bin/:/home/micah/.config/Scripts/:/home/micah/.gem/ruby/2.5.0/bin/:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# enable goto
if [ -f ~/.config/goto/goto.sh ]; then
  [ ! -f ~/.goto ] && touch ~/.goto
  source ~/.config/goto/goto.sh
fi

# make sure tasks folder exists for t
if [ ! -d ~/.tasks ]; then
  mkdir -p ~/.tasks;
fi

[ -f ~/.config/Scripts/pins.sh ] && source ~/.config/Scripts/pins.sh

export DBSTRING="postgres://postgres:postgres@localhost/postgres?sslmode=disable"

(cat ~/.cache/wal/sequences &)

ufetch
if [ $(t|wc -l) -gt 0 ]; then
  echo "Tasks:"
  t
  echo ""
fi
