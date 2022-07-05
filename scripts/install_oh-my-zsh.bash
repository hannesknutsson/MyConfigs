#!/usr/bin/env bash
#
#	Installs Oh My Zsh!
#

echo "----------------------------------------"
date

#Auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#Checks if Oh My Zsh! is installed and cancels installation if already installed.
if [[ -d $HOME/.oh-my-zsh ]]
then
	echo "Oh My ZSH! is already installed... Skipping installation script..."
	exit 1337
fi

#Checks if zsh and wget are installed. We need them for this script. Exits if they are not available.
if [[ `command -v zsh` && `command -v wget` ]]
then
	echo "All prerequisites are available!"
else
	echo "Install zsh and wget first..."
	exit 1337
fi

#Install Oh My ZSH!
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

#Change default shell
echo "Script will ask for your password to be able to set your login shell."
chsh -s /bin/zsh

