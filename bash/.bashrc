
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export QSYS_ROOTDIR="/home/micah/intelFPGA_lite/17.1/quartus/sopc_builder/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
