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
			sudo apt-get install "$@"
		fi
	;;
	"update"|"upgrade") 
		shift	
		if [ -x "$(command -v xbps-install)" ];then
			sudo xbps-install -u "$@"
		elif [ -x "$(command -v pacman)" ];then
			sudo pacman -Syu
		elif [ -x "$(command -v apt)" ];then
			sudo apt-get upgrade "$@"
		fi
 	;;
	"search") 
		shift	
		if [ -x "$(command -v xbps-install)" ];then
			sudo xbps-query "$@"
		elif [ -x "$(command -v pacman)" ];then
			sudo pacman -Ss "$@"
		elif [ -x "$(command -v apt)" ];then
			sudo apt-get search "$@"
		fi
 	;;
	"uninstall"|"remove") 
		shift	
		if [ -x "$(command -v xbps-install)" ];then
			sudo xbps-remove "$@"
		elif [ -x "$(command -v pacman)" ];then
			sudo pacman -Rsc "$@"
		elif [ -x "$(command -v apt)" ];then
			sudo apt-get remove "$@"
		fi
 	;;
esac
