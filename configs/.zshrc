# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hanke/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall





#User specific additions
alias ubuntu="docker run -it --rm ubuntu:latest"