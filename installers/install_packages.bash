#!/usr/bin/env bash
#
#	Installs a set of packages defined in the file input as the first parameter to this
#	script using whatever package manager is available.
#

if [ "$(whoami)" != "root" ]
then
	echo -e "\t\nNot running as root. Canceling...\n"
	exit 1
fi

PACKAGE_LIST=$1

PACKAGES=`cat $PACKAGE_LIST`
PACKAGES_NICE="${PACKAGES//$'\n'/, }"

LOG_LOCATION=installations.log

echo "----------------------------------------" > $LOG_LOCATION
date > $LOG_LOCATION

echo -e "\n\t* Packages to install: $PACKAGES_NICE"

if [[ `command -v apt` ]]
then
	echo -e "\n\t* apt detected. Installing packages using apt...\n"
	apt install -y $PACKAGES >> $LOG_LOCATION
elif [[ `command -v yum` ]]
then
	echo -e "\n\t* yum detected. Installing packages using yum...\n"
	yum install -y --skip-broken $PACKAGES >> $LOG_LOCATION
elif [[ `command -v pacman` ]]
then
	echo -e "\n\t* pacman detected. Installing packages using pacman...\n"
	pacman -S --noconfirm $PACKAGES >> $LOG_LOCATION
else
	echo -e "\n\t* Could not find any package manager. Concider adding it to this script. Canceling...\n"
fi

echo -e "\n\t* The package manager output will be saved to $LOG_LOCATION"
