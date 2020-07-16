#!/bin/bash
#
#	Installs a set of packages defined in the file "packages" using whatever package manager is available.
#

if [[ `command -v apt` ]]
then
	echo "apt detected. Installing packages using apt..."
	apt install -y `cat packages`
elif [[ `command -v yum` ]]
then
	echo "yum detected. Installing packages using yum..."
	yum install -y --skip-broken `cat packages`
else
	echo "Could not find any package manager. Canceling..."
fi
