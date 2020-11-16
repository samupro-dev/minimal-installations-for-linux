#!/bin/bash
DONE="\e[0;32m ✔\e[0m"
ERROR="\e[0;31m X\e[0m"
YELLOW="\e[1;33m"
LIGHT_RED="\e[1;31m"
LIGHT_GREEN="\e[1;32m"
COLOR_NULL="\e[0m"
LIGHT_BLUE="\e[1;34m"
PURPLE="\e[0;35m"

echo -e "${PURPLE}  ██████  ▄▄▄       ███▄ ▄███▓ █    ██  ██▓███   ██▀███   ▒█████  
▒██    ▒ ▒████▄    ▓██▒▀█▀ ██▒ ██  ▓██▒▓██░  ██▒▓██ ▒ ██▒▒██▒  ██▒
░ ▓██▄   ▒██  ▀█▄  ▓██    ▓██░▓██  ▒██░▓██░ ██▓▒▓██ ░▄█ ▒▒██░  ██▒
  ▒   ██▒░██▄▄▄▄██ ▒██    ▒██ ▓▓█  ░██░▒██▄█▓▒ ▒▒██▀▀█▄  ▒██   ██░
▒██████▒▒ ▓█   ▓██▒▒██▒   ░██▒▒▒█████▓ ▒██▒ ░  ░░██▓ ▒██▒░ ████▓▒░
▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░░ ▒░   ░  ░░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░ 
░ ░▒  ░ ░  ▒   ▒▒ ░░  ░      ░░░▒░ ░ ░ ░▒ ░       ░▒ ░ ▒░  ░ ▒ ▒░ 
░  ░  ░    ░   ▒   ░      ░    ░░░ ░ ░ ░░         ░░   ░ ░ ░ ░ ▒  
      ░        ░  ░       ░      ░                 ░         ░ ░  ${COLOR_NULL}"
echo -e "${LIGHT_BLUE} This script will install the minimum things to get a VPS running. ${COLOR_NULL}"
sleep 1
echo -e "\n"

echo -e " ${YELLOW} Control of administration permissions. . . ${COLOR_NULL}"
if [ "$(id -u)" != "0" ] ; then
	echo " ${ERROR} ${LIGHT_RED}This script requires root permissions. Please run this as root! ${COLOR_NULL}"
	exit 2
fi
echo -e " ${DONE} ${LIGHT_GREEN}Congratulations, this script will be run as root. ${COLOR_NULL}"
echo -e "\n"

echo -e "${YELLOW} Checking the sudo package. . . ${COLOR_NULL}"
apt-get install -y sudo

echo -e "\n"
echo -e "${YELLOW} Installation of the minimum packages in progress. . . ${COLOR_NULL}"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get install -y unzip
sudo apt-get install -y zip
sudo apt-get install -y tar
sudo apt-get install -y perl
sudo apt-get install -y wget
sudo apt-get install -y nodejs
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y software-properties-common
sudo apt-get install -y htop
sudo apt-get install -y npm
sudo apt-get install -y git
sudo apt-get install -y curl

echo -e "\n"
echo -e "${YELLOW} Installation of Apache2 ${COLOR_NULL}"
sudo apt-get install -y apache2

echo -e "\n"
echo -e "${YELLOW} Installation of PHP ${COLOR_NULL}"
sudo apt-get install -y php
sudo apt-get install -y php-common php-zip php-curl php-xml php-xmlrpc php-json php-mysql php-gd php-imagick php-ldap php-imap php-mbstring php-intl php-cli php-tidy php-bcmath
sudo apt-get install -y libapache2-mod-php
systemctl restart apache2

echo -e "\n"
echo -e "${YELLOW} Installation of Java 8 ${COLOR_NULL}"
sudo apt-get install -y apt-transport-https ca-certificates dirmngr gnupg
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt-get -y update
sudo apt-get install -y adoptopenjdk-8-hotspot

echo -e "\n"
echo -e "${YELLOW} I am updating all packages (this is the last step) ${COLOR_NULL}"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

echo -e "\n"
echo -e "${LIGHT_GREEN} The installation finished successfully! ${COLOR_NULL}"
echo -e "${LIGHT_GREEN} Thanks for using this script. ${COLOR_NULL}"