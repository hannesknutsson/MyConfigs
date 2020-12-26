#!/bin/bash

#Install packages we need before customizing stuff
sudo ./install_packages ../packages/i3_packages

#Install i3lock-fancy
(git clone https://github.com/meskarune/i3lock-fancy.git && cd i3lock-fancy && sudo make install)
#Remove sources for i3lock-fancy
rm -rf i3lock-fancy

