#!/bin/sh

source functions

if [[ $EUID -eq 0 ]]; then
	INSTALL_DEPENDENCY
	DISABLE_SELINUX
	INSTALL_RDO_EPEL
	
	exit 0
else
	USER_NAME=$(whoami)
	echo "You are running this script as $USER_NAME, please run as root."
	exit 0
fi

