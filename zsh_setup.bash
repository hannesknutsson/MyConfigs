#!/bin/bash
#
#	Installs and configures ZSH and Oh My Zsh!
#
#	Requires root to be able to install required fonts.
#

#Install ZSH (and some other stuff :D)
apt install -y zsh wget
yum install -y zsh wget


#Install Oh My ZSH!
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

#Change default shell
usermod -s /bin/zsh $USER
