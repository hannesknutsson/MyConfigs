#!/usr/bin/env bash
#
#	Installs Oh My Zsh!
#

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
	echo -e "Debian based:\tapt install -y zsh wget"
	echo -e "RHEL based:\tyum install -y zsh wget"

	exit 1337
fi

#Install Oh My ZSH!
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

#Change default shell
usermod -s /bin/zsh $USER
