#!/bin/bash

sudo clear

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

	echo "───────────────────────────────────────"
	echo "───▐▀▄───────▄▀▌───▄▄▄▄▄▄▄─────────────"
	echo "───▌▒▒▀▄▄▄▄▄▀▒▒▐▄▀▀▒██▒██▒▀▀▄──────────"
	echo "──▐▒▒▒▒▀▒▀▒▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄────────"
	echo "──▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▒▒▒▒▒▒▒▒▀▄──────"
	echo "▀█▒▒▒█▌▒▒█▒▒▐█▒▒▒▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌─────"
	echo "▀▌▒▒▒▒▒▒▀▒▀▒▒▒▒▒▒▀▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐───▄▄"
	echo "▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌▄█▒█"
	echo "▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒█▀─"
	echo "▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▀───"
	echo "▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌────"
	echo "─▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐─────"
	echo "─▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌─────"
	echo "──▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐──────"
	echo "──▐▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▌──────"
	echo "────▀▄▄▀▀▀▀▀▄▄▀▀▀▀▀▀▀▄▄▀▀▀▀▀▄▄▀────────"
	echo ""
	echo "            Update Cat!!"
	echo "            ------------"
	echo "            by Eric Ness"
	echo ""
	echo "---------------------------------------"
	echo "| Update System                       |"
    echo "---------------------------------------"

    echo -n " - ${green}Updating Apt-Get... "
	sudo apt-get update --fix-missing --allow-downgrades >/dev/null	
	wait 
	echo "           ${red}Done!${reset}"

	echo -n " - ${green}Upgrading Apt-Get... "
	sudo apt-get upgrade -y --fix-missing --allow-downgrades >/dev/null
	wait
	echo "          ${red}Done!${reset}"

	echo -n " - ${green}Dist-Upgrade Apt-Get... "
 	sudo apt-get dist-upgrade -y --fix-missing --allow-downgrades >/dev/null
 	wait
	echo "       ${red}Done!${reset}"

 	echo -n " - ${green}Auto Remove Apt-Get... "
  	sudo apt-get autoremove -y >/dev/null
  	wait
	echo "        ${red}Done!${reset}"

	echo -n " - ${green}Clean Apt-Get... "
   	sudo apt-get clean
   	wait
	echo "              ${red}Done!${reset}"

  	echo -n " - ${green}Auto Clean Apt-Get... "
   	sudo apt-get autoclean -y >/dev/null
   	wait
	echo "         ${red}Done!${reset}"

   	echo -n " - ${green}Fix Broken Apt-Get... "
   	sudo apt --fix-broken install &>/dev/null 
   	wait
	echo "         ${red}Done!${reset}"

{ # try
	echo "---------------------------------------"
	echo "| Cleaning Crash Folder               |"
    echo "---------------------------------------"

	files=$(shopt -s nullglob dotglob; echo /var/crash/*)
	if (( ${#files} ))
	then
		echo -n " - ${green}Deleting the contents of the crash folder${reset}"
		sudo rm /var/crash/*
	else 
		echo -n " - ${green}The crash folder is empty${reset}"
	fi

} || { # catch
    echo -n " - ${green}Error occured cleaning the crash folder!${reset}"
}
	
	echo ""
	echo "---------------------------------------"
	echo "| Clearing Swap                       |"
	echo "---------------------------------------"
echo -n " - ${green}Clearing swap..."
sudo swapoff -a; sudo swapon -a;
echo "               ${red}Done!${reset}"
echo ""