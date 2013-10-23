#!/bin/sh

source prepare

if [[ $EUID -eq 0 ]]; then
	INSTALL_DEPENDENCY
	DISABLE_SELINUX
	INSTALL_RDO_EPEL
	DOWNLOAD
	START_SERVICE
	CONFIG_RABBITMQ
	CONFIG_MYSQL
	
	exit 0
else
	USER_NAME=$(whoami)
	echo "You are running this script as $USER_NAME, please run as root."
	exit 0
fi

