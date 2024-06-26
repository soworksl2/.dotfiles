#prompt
PS1="\n[\w]\n[\u]--> "


#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Variables
#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

#Editors
export EDITOR="nvim"
export VISUAL="nvim"


#Aliases
alias ls='ls --color'
alias rm='echo "rm was disabled with an alias. if you really want to use it use -> \rm"' #disable rm
alias del="$HOME/user_scripts/sdel" #use trash-cli to delete files

# add Rust Cargo Stuffs
. "$HOME/.cargo/env"
