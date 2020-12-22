#/bin/bash

echo "Script may prompt for your password to be able to install packages as super user..."\
&& sudo ./install_packages.bash \
&& ./install_oh-my-zsh.bash
&& ./setup.bash

