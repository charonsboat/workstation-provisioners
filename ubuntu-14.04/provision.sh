#!/usr/bin/env bash


# Copy stdout to a log file
exec > >(tee --append "${HOME}/box-setup.log")

# Redirect stderr to stdout so it can also be copied to the log file
exec 2>&1

# suppress prompts
export DEBIAN_FRONTEND=noninteractive

# using a tmp dir to store any downloaded files or logs
# /var/tmp files are supposed to persist even on reboot
tmp="/var/tmp"

helpers="./helpers"
lib="./lib"
scripts="./scripts"


# execute the fix ubuntu script to ensure additional privacy
. ${lib}/fixubuntu.sh

# retrieve and extract consolas because it is my favorite programming font
. ${lib}/consolas.sh

# load utility functions
. ${helpers}/utilities.sh


print_line "1. Install System Updates #########################################"
# update system packages
sudo -E apt-get update -qq > /dev/null

# upgrade system packages
sudo -E apt-get upgrade -qq > /dev/null && sudo -E apt-get dist-upgrade -y > /dev/null


print_line "2. Install Packages ###############################################"
# run the package installation script
. ${scripts}/install.sh


# accept the ttf-mscorefonts-installer EULA ahead of time
sudo debconf-set-selections <<< "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true"


# create commonly required directories
cd "${HOME}"
mkdir -p "bin" "Projects" ".icons" ".themes"

# download icon packs
cd ./.icons
git clone https://github.com/NitruxSA/flattr-icons.git
git clone https://github.com/xcjs/flattr-dark.git
cd ..

# download themes
cd ./.themes
git clone https://github.com/wfpaisa/Plane-Gtk3.git
git clone https://github.com/wfpaisa/Plane-Gtk3-White.git
cd ..

# symlink the themes and icon packs into root directories
sudo ln -s ./.icons /root/.icons
sudo ln -s ./.themes /root/.themes
