#prompt
PS1="\n[\w]\n[\u]--> "


#adding some xdg stuff
export XDG_BIN_HOME="$HOME/.local/bin"
export PATH="${XDG_BIN_HOME}:${PATH}"


#Editors
export EDITOR="nvim"
export VISUAL="nvim"


#Aliases
alias mv='mv --interactive'
alias ls='ls --color'
alias rm="$HOME/user_scripts/srm"
alias vim='nvim'
