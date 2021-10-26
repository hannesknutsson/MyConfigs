# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lukerandall" #This theme works well in most environments :)

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh

# User configuration

. ~/.generic_rc

export EDITOR='vim'
setopt HIST_IGNORE_SPACE

source <(kubectl completion zsh)
complete -F __start_kubectl k
