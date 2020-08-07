#!/bin/bash
#
#	Installs a set of packages defined in the file "packages" using whatever package manager is available.
#

if [ "$(whoami)" != "root" ]
then
	echo -e "\t\nNot running as root. Canceling...\n"
	exit 1
fi

PACKAGES=`cat packages`
PACKAGES_NICE="${PACKAGES//$'\n'/, }"

echo -e "\n\t* Packages to install: $PACKAGES_NICE"

if [[ `command -v apt` ]]
then
	echo -e "\n\t* apt detected. Installing packages using apt...\n"
	apt install -y $PACKAGES
elif [[ `command -v yum` ]]
then
	echo -e "\n\t* yum detected. Installing packages using yum...\n"
	yum install -y --skip-broken $PACKAGES
elif [[ `command -v pacman` ]]
then
	echo -e "\n\t* pacman detected. Installing packages using pacman...\n"
	pacman -S --noconfirm $PACKAGES
else
	echo -e "\n\t* Could not find any package manager. Canceling...\n"
fi
