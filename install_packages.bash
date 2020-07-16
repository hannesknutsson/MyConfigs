#!/bin/bash
#
#	Installs a set of packages defined in the file "packages" using whatever package manager is available.
#

if [[ `command -v apt` ]]
then
	echo -e "\n\t* apt detected. Installing packages using apt...\n"
	apt install -y `cat packages`
elif [[ `command -v yum` ]]
then
	echo -e "\n\t* yum detected. Installing packages using yum...\n"
	yum install -y --skip-broken `cat packages`
else
	echo -e "\n\t* Could not find any package manager. Canceling...\n"
fi
