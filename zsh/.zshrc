if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export DEFAULT_USER="micah"
export BROWSER="/usr/bin/qutebrowser"
export LC_ALL=en_US.UTF-8

export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000

export QSYS_ROOTDIR="/home/micah/intelFPGA_lite/17.1/quartus/sopc_builder/bin"

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt INTERACTIVECOMMENTS
setopt CORRECT

source ~/.zsh_aliases
source ~/.zsh_shortcuts

# terminal vim
export KEYTIMEOUT=10
bindkey -M viins 'fj' vi-cmd-mode
bindkey -M viins 'jf' vi-cmd-mode
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

PATH="/home/micah/.config/Scripts/:/home/micah/.gem/ruby/2.5.0/bin:$PATH"

(cat ~/.cache/wal/sequences &)

ufetch
