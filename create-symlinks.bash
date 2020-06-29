#/bin/bash
#
#	Creates links from the home directory to the configuration files in the configs directory
#
#	Run this script from the directory in which it is located or fix the script to support otherwise :))))))

WD=`pwd`
RELATIVE_CONF_PATH=configs
CONF_PATH=$WD/$RELATIVE_CONF_PATH

echo "Creating sym links for config files from $HOME to $CONF_PATH"

ln -sf $CONF_PATH/.vimrc $HOME/.vimrc

echo "Done :)"
