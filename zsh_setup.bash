#!/bin/bash
#
#	Installs and configures ZSH and Oh My Zsh!
#
#	Requires root to be able to install required fonts.
#

#Install ZSH
sudo apt install zsh

#Install Oh My Zsh!
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Install required fonts
sudo apt-get install fonts-powerline
sudo dnf install powerline-fonts

#chsh -s /bin/zsh #Commented out because the installer solves this anyway...
