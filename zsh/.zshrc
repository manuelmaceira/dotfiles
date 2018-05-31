# set up antigen plugin manager
if [ -f /usr/share/zsh/share/antigen.zsh ]; then
  source /usr/share/zsh/share/antigen.zsh
  antigen use prezto
  antigen bundle sorin-ionescu/prezto modules/git
  antigen bundle sorin-ionescu/prezto modules/utility
  antigen bundle sorin-ionescu/prezto modules/completion
  antigen bundle mafredri/zsh-async
  antigen bundle sindresorhus/pure
  antigen apply

  # terminal vim
  export KEYTIMEOUT=10
  bindkey -M viins 'fj' vi-cmd-mode
  bindkey -M viins 'jf' vi-cmd-mode
  bindkey -M viins '^a' vi-beginning-of-line
  bindkey -M viins '^e' vi-end-of-line
  bindkey -M viins '^k' kill-line
  bindkey '^r' history-incremental-search-backward

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
fi

# set up environmental variables
export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export DEFAULT_USER="micah"
export BROWSER="/usr/bin/qutebrowser"
export LC_ALL=en_US.UTF-8
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# set up go environment variables
export GOPATH="/home/micah/go"
export GOBIN="$GOPATH/bin"

export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt INTERACTIVECOMMENTS
setopt CORRECT

source ~/.zsh_aliases
source ~/.zsh_shortcuts

PATH="/home/micah/.config/Scripts/:/home/micah/.gem/ruby/2.5.0/bin:/home/micah/go/bin:$PATH"

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
[ -f ~/.config/Scripts/tasks.sh ] && source ~/.config/Scripts/tasks.sh

(cat ~/.cache/wal/sequences &)

ufetch
if [ $(t|wc -l) -gt 0 ]; then
  echo "Tasks:"
  echo `t`
  echo ""
fi
