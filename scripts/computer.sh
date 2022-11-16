#!/usr/bin/env bash

pkg_managers=("xbps-install" "pacman" "apt" "dnf" "zypper" "emerge")

for pkg in "${pkg_managers[@]}"
do
	if [ -x "$(command -v $pkg)" ];then
		break
	fi
done
case "$1" in
	"reboot") sudo reboot ;;
	"install")
		shift
		if [ $pkg = "xbps-install" ] || [ $pkg = "emerge" ];then
			sudo $pkg "$@"
		elif [ $pkg = "pacman" ];then
			sudo $pkg -S "$@"
		else
			sudo $pkg install "$@"
		fi
	;;
	"update"|"upgrade")
		shift
		if [ $pkg = "xbps-install" ];then
			sudo $pkg -u "$@"
		elif [ $pkg = "pacman" ];then
			sudo $pkg -Syu
		elif [ $pkg = "apt" ];then
			sudo $pkg upgrage "$@"
		elif [ $pkg = "emerge" ];then
			sudo emerge -[a]uDN @world "$@"
		else
			sudo $pkg update "$@"
		fi
	;;
	"search")
		shift
		if [ $pkg = "xbps-install" ];then
			sudo xbps-query "$@"
		elif [ $pkg = "pacman" ];then
			sudo $pkg -Ss
		elif [ $pkg = "emerge" ];then
			sudo emerge -s "$@"
		else
			sudo $pkg search "$@"
		fi
	;;
	"unistall"|"remove")
		shift
		if [ $pkg = "xbps-install" ];then
			sudo xbps-remove "$@"
		elif [ $pkg = "pacman" ];then
			sudo $pkg -Rs
		elif [ $pkg = "emerge" ];then
			sudo emerge -c "$@"
		else
			sudo $pkg remove "$@"
		fi

esac
