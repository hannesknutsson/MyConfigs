#!/usr/bin/env bash
#
#	Creates links from the home directory to the configuration files in the configs directory
#
#	Run this script from the directory in which it is located or fix the script to support otherwise :))))))

#Path definitions --------------------------------------------------------------

WD=`pwd`
RELATIVE_CONF_PATH=configs
CONF_PATH=$WD/$RELATIVE_CONF_PATH
OLD_CONFS_DIR=$HOME/.old_configs

#Functions ---------------------------------------------------------------------

#Function for checking if a file ($1) is a regular file. If it is a regular file, move it to the new location ($2).
move_if_regular_file() {
	FILE_ORIGINAL=$1
	FILE_DESTINATION=$2
	if [[ -f "$FILE_ORIGINAL" && ! -h "$FILE_ORIGINAL" ]]
	then
		#Original file is a regular file and shall be moved.
		echo -e "\tNon version handled file located at \"$FILE_ORIGINAL\" will be moved to \"$FILE_DESTINATION\"."
		mv $FILE_ORIGINAL $FILE_DESTINATION
	fi
}

#Function for replacing regular files with symbolic links to respective Git handled files. Original file are moved to ~/.old_configs .
link_conf_file() {
	LINK_DESTINATION=$1
	LINK_LOCATION=$2
	mkdir $OLD_CONFS_DIR 2> /dev/null
	move_if_regular_file $LINK_LOCATION $OLD_CONFS_DIR
	ln -sf $LINK_DESTINATION $LINK_LOCATION
}

#Script start ------------------------------------------------------------------

echo -e "Configs will be linked from $HOME to $CONF_PATH\n"

#Make sure directories exist ---------------------------------------------------

mkdir $HOME/.config 2> /dev/null
mkdir $HOME/.local 2> /dev/null
mkdir $HOME/.local/share 2> /dev/null

#VIM ---------------------------------------------------------------------------
echo -e " * VIM"
link_conf_file	$CONF_PATH/.vimrc 			$HOME/.vimrc
link_conf_file	$CONF_PATH/.ideavimrc 			$HOME/.ideavimrc

#GIT ---------------------------------------------------------------------------
echo -e " * GIT"
link_conf_file	$CONF_PATH/.gitconfig 			$HOME/.gitconfig
link_conf_file	$CONF_PATH/.gitignore_global		$HOME/.gitignore_global

#SSH ---------------------------------------------------------------------------
echo -e " * SSH"
SSH_DIR=$HOME/.ssh
SSH_CONFIG=$SSH_DIR/config
SSH_CONFIG_LOCAL=$SSH_DIR/.config_local

mkdir $SSH_DIR 2> /dev/null
move_if_regular_file $SSH_CONFIG $SSH_CONFIG_LOCAL

#If the local ssh config does not exist, we create it and add some comments to it explaining what's up. Also set its permissions to 600.
if [ ! -f "$SSH_CONFIG_LOCAL" ]; then
    echo "#This is a local config for the ssh client.
#This config is appended to the more generic configuration located in $SSH_CONFIG .
#Place any client/system specific configurations in this file to not have them appear in the config repository.
" > $SSH_CONFIG_LOCAL
    chmod 600 $SSH_CONFIG_LOCAL
fi

link_conf_file	$CONF_PATH/.ssh/known_hosts_global	$HOME/.ssh/known_hosts_global
link_conf_file	$CONF_PATH/.ssh/config 			$HOME/.ssh/config

#ZSH ---------------------------------------------------------------------------
echo -e " * ZSH"
link_conf_file	$CONF_PATH/.zshrc			$HOME/.zshrc

#BASH --------------------------------------------------------------------------
echo -e " * BASH"
link_conf_file	$CONF_PATH/.bashrc			$HOME/.bashrc

#KONSOLE -----------------------------------------------------------------------
echo -e " * KONSOLE"
mkdir $HOME/.local/share/konsole 2> /dev/null
link_conf_file	$CONF_PATH/.local/share/konsole/Hanke.profile	$HOME/.local/share/konsole/Hanke.profile
link_conf_file	$CONF_PATH/.config/konsolerc			$HOME/.config/konsolerc

#i3 ----------------------------------------------------------------------------
echo -e " * i3"
mkdir $HOME/.config/i3 2> /dev/null
link_conf_file	$CONF_PATH/.config/i3/config		$HOME/.config/i3/config

#awesome WM --------------------------------------------------------------------
echo -e " * awesome WM"
link_conf_file	$CONF_PATH/.config/awesome/rc.lua	    $HOME/.config/awesome/rc.lua
link_conf_file	$CONF_PATH/.config/awesome/theme.lua	$HOME/.config/awesome/theme.lua
link_conf_file	$CONF_PATH/.config/awesome/background.jpg	    $HOME/.config/awesome/background.jpg

#autorandr ---------------------------------------------------------------------
echo -e " * autorandr"
link_conf_file	$CONF_PATH/.config/autorandr/3-displays/setup	$HOME/.config/autorandr/3-displays/setup
link_conf_file	$CONF_PATH/.config/autorandr/3-displays/config	$HOME/.config/autorandr/3-displays/config

#OTHER -------------------------------------------------------------------------
echo -e  " * Misc configs"
link_conf_file	$CONF_PATH/.selected_editor		$HOME/.selected_editor
link_conf_file	$CONF_PATH/.generic_rc			$HOME/.generic_rc
link_conf_file	$CONF_PATH/.aliases			$HOME/.aliases
link_conf_file	$CONF_PATH/.profile			$HOME/.profile
link_conf_file	$CONF_PATH/.zprofile			$HOME/.zprofile
link_conf_file	$CONF_PATH/.generic_profile		$HOME/.generic_profile

#Set 600 to all config files and 700 to all sub directories
echo -e "\nSetting permissions"
find $CONF_PATH -type f -exec chmod 600 -- {} +
find $CONF_PATH -type d -exec chmod 700 -- {} +

#Script done -------------------------------------------------------------------
