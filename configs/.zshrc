# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lukerandall" #This theme works well in most environments :)

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='vim'

#ABOVE STUFF IS SET UP BY OH MY ZSH (???) my configs below this line.
. ~/.aliases
