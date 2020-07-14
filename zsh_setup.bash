#!/bin/bash
#
#	Installs and configures ZSH and Oh My Zsh!
#
#	Requires root to be able to install required fonts.
#

#Install ZSH (and some other stuff :D)
apt install -y zsh wget vim

#Install Oh My Zsh!
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

#Install required fonts
apt-get install -y fonts-powerline
dnf install powerline-fonts

chsh -s /bin/zsh
