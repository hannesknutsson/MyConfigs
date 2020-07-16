#/bin/bash
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

echo -e "\nLinking configs from $HOME to $CONF_PATH"

#VIM ---------------------------------------------------------------------------
echo -e "\n * VIM..."
link_conf_file	$CONF_PATH/.vimrc 		$HOME/.vimrc
link_conf_file	$CONF_PATH/.ideavimrc 		$HOME/.ideavimrc

#GIT ---------------------------------------------------------------------------
echo -e "\n * GIT..."
link_conf_file	$CONF_PATH/.gitconfig 		$HOME/.gitconfig
link_conf_file	$CONF_PATH/.gitignore_global	$HOME/.gitignore_global

#SSH ---------------------------------------------------------------------------
echo -e "\n * SSH..."
SSH_DIR=$HOME/.ssh
SSH_CONFIG=$SSH_DIR/config
SSH_CONFIG_LOCAL=$HOME/.ssh_local_config

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

link_conf_file	$CONF_PATH/.ssh/known_hosts 	$HOME/.ssh/known_hosts
link_conf_file	$CONF_PATH/.ssh/config 		$HOME/.ssh/config

#ZSH ---------------------------------------------------------------------------
echo -e "\n * ZSH..."
link_conf_file	$CONF_PATH/.zshrc		$HOME/.zshrc

#OTHER -------------------------------------------------------------------------
echo -e  "\n * Misc configs..."
link_conf_file	$CONF_PATH/.selected_editor	$HOME/.selected_editor

#Set 600 to all config files and 700 to all sub directories
echo -e "\n\nSetting permissions"
find $CONF_PATH -type f -exec chmod 600 -- {} +
find $CONF_PATH -type d -exec chmod 700 -- {} +

#Script done -------------------------------------------------------------------

echo -e "\nDone :)\n"
