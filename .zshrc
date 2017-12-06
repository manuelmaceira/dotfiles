ZSH_THEME="agnoster"

ZSH=$HOME/.oh-my-zsh

plugins=(ant common-aliases cp extract git git-extras mvn python scala sbt tmux tmuxinator ubuntu vi-mode wd)

export TERM="tmux-256color"
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export DEFAULT_USER="micah"

export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt RM_STAR_WAIT
setopt interactivecomments
setopt CORRECT

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases

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

#source ~/.bin/tmuxinator.zsh

# history substring search
source $ZSH/plugins/history-substring-search/history-substring-search.zsh
zmodload zsh/terminfo
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

PATH="/opt/venvs/vdirsyncer-latest/bin/:$PATH"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

neofetch --ascii_distro arch
