#!/usr/bin/env bash

if [ "$1" = "reboot" ]; then
	shift
	sudo reboot
elif [ "$1" = "install" ]; then
	shift
	if [ -x "$(command -v xbps-install)" ];then
		sudo xbps-install "$@"
	elif [ -x "$(command -v pacman)" ];then
		sudo pacman -S "$@"
	elif [ -x "$(command -v apt)" ];then
		sudo apt-get install "$@"
	fi
elif [ "$1" = "update" ] || [ "$1" = "upgrade" ]; then
	shift
	if [ -x "$(command -v xbps-install)" ];then
		sudo xbps-install -u "$@"
	elif [ -x "$(command -v pacman)" ];then
		sudo pacman -Syu
	elif [ -x "$(command -v apt)" ];then
		sudo apt-get upgrade "$@"
	fi
elif [ "$1" = "search" ]; then
	shift
	if [ -x "$(command -v xbps-install)" ];then
		sudo xbps-query "$@"
	elif [ -x "$(command -v pacman)" ];then
		sudo pacman -Ss "$@"
	elif [ -x "$(command -v apt)" ];then
		sudo apt-get search "$@"
	fi
elif [ "$1" = "uninstall" ] || [ "$1" = "remove" ]; then
	shift
	if [ -x "$(command -v xbps-install)" ];then
		sudo xbps-remove "$@"
	elif [ -x "$(command -v pacman)" ];then
		sudo pacman -Rsc "$@"
	elif [ -x "$(command -v apt)" ];then
		sudo apt-get remove "$@"
	fi
fi
