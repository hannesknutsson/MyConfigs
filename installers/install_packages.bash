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

mkdir logs 2> /dev/null
LOG_LOCATION=logs/package_manager.log

echo "----------------------------------------" >> $LOG_LOCATION
date >> $LOG_LOCATION

echo -e "\n\t* Packages to install: $PACKAGES_NICE"

if [[ `command -v apt` ]]
then
	echo -e "\n\t* apt detected. Installing packages using apt..."
	apt install -y $PACKAGES >> $LOG_LOCATION 2>&1
elif [[ `command -v yum` ]]
then
	echo -e "\n\t* yum detected. Installing packages using yum..."
	yum install -y --skip-broken $PACKAGES >> $LOG_LOCATION 2>&1
elif [[ `command -v pacman` ]]
then
	echo -e "\n\t* pacman detected. Installing packages using pacman..."
	pacman -S --noconfirm $PACKAGES >> $LOG_LOCATION 2>&1
else
	echo -e "\n\t* Could not find any package manager. Concider adding it to this script. Canceling..."
fi

echo -e "\n\t* The package manager output will be saved to $LOG_LOCATION\n"
