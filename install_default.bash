#/bin/bash

echo "Script may prompt for your password to be able to install packages as super user..."\
&& sudo ./installers/install_packages.bash packages/default_cli_packages \
&& ./installers/install_oh-my-zsh.bash \
&& ./symlink_configs.bash \
zsh
