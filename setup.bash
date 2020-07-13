#/bin/bash
#
#	Creates links from the home directory to the configuration files in the configs directory
#
#	Run this script from the directory in which it is located or fix the script to support otherwise :))))))

WD=`pwd`
RELATIVE_CONF_PATH=configs
CONF_PATH=$WD/$RELATIVE_CONF_PATH

echo "Creating sym links for config files from $HOME to $CONF_PATH"

ln -sf $CONF_PATH/.vimrc 		$HOME/.vimrc
ln -sf $CONF_PATH/.ideavimrc 		$HOME/.ideavimrc

ln -sf $CONF_PATH/.gitconfig 		$HOME/.gitconfig
ln -sf $CONF_PATH/.gitignore_global	$HOME/.gitignore_global

mkdir $HOME/.ssh 2> /dev/null
ln -sf $CONF_PATH/.ssh/known_hosts 	$HOME/.ssh/known_hosts
ln -sf $CONF_PATH/.ssh/config 		$HOME/.ssh/config

ln -sf $CONF_PATH/.selected_editor	$HOME/.selected_editor

#Set 600 to all config files and 700 to all sub directories
find $CONF_PATH -type f -exec chmod 600 -- {} +
find $CONF_PATH -type d -exec chmod 700 -- {} +

echo "Done :)"
