#!/usr/bin/env bash

case "$1" in
	"reboot") sudo reboot ;;
	"install")
		shift	
		if [ -x "$(command -v xbps-install)" ];then
			sudo xbps-install "$@"
		elif [ -x "$(command -v pacman)" ];then
			sudo pacman -S "$@"
		elif [ -x "$(command -v apt)" ];then
			sudo apt install "$@"
		elif [ -x "$(command -v dnf)" ];then
			sudo dnf install "$@"
		elif [ -x "$(command -v zypper)" ];then
			sudo zypper install  "$@"
		elif [ -x "$(command -v emerge)" ];then
			sudo emerge "$@"
		fi
	;;
	"update"|"upgrade") 
		shift	
		if [ -x "$(command -v xbps-install)" ];then
			sudo xbps-install -u "$@"
		elif [ -x "$(command -v pacman)" ];then
			sudo pacman -Syu
		elif [ -x "$(command -v apt)" ];then
			sudo apt upgrade "$@"
		elif [ -x "$(command -v dnf)" ];then
			sudo dnf update "$@"
		elif [ -x "$(command -v zypper)" ];then
			sudo zypper update "$@"
		elif [ -x "$(command -v emerge)" ];then
			sudo emerge -[a]uDN @world "$@"
		fi
 	;;
	"search") 
		shift	
		if [ -x "$(command -v xbps-install)" ];then
			sudo xbps-query "$@"
		elif [ -x "$(command -v pacman)" ];then
			sudo pacman -Ss "$@"
		elif [ -x "$(command -v apt)" ];then
			sudo apt search "$@"
		elif [ -x "$(command -v dnf)" ];then
			sudo dnf search "$@"
		elif [ -x "$(command -v zypper)" ];then
			sudo zypper search "$@"
		elif [ -x "$(command -v emerge)" ];then
			sudo emerge -s "$@"
		fi
 	;;
	"uninstall"|"remove") 
		shift	
		if [ -x "$(command -v xbps-install)" ];then
			sudo xbps-remove "$@"
		elif [ -x "$(command -v pacman)" ];then
			sudo pacman -Rs "$@"
		elif [ -x "$(command -v apt)" ];then
			sudo apt autoremove "$@"
		elif [ -x "$(command -v dnf)" ];then
			sudo dnf remove "$@"
		elif [ -x "$(command -v zypper)" ];then
			sudo zypper remove "$@"
		elif [ -x "$(command -v emerge)" ];then
			sudo emerge -c "$@"
		fi
 	;;
esac
