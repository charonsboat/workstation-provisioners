#!/usr/bin/env bash


current_directory=$(pwd)

# Copy stdout to a log file
exec > >(tee --append "${current_directory}/box-setup.log")

# Redirect stderr to stdout so it can also be copied to the log file
exec 2>&1

# suppress prompts
export DEBIAN_FRONTEND=noninteractive

# using a tmp dir to store any downloaded files or logs
# /var/tmp files are supposed to persist even on reboot
tmp="/var/tmp"

helpers="${current_directory}/helpers"
lib="${current_directory}/lib"
scripts="${current_directory}/scripts"


# execute the fix ubuntu script to ensure additional privacy
. ${lib}/fixubuntu.sh > /dev/null
cd ${current_directory}

# load utility functions
. ${helpers}/utilities.sh > /dev/null
cd ${current_directory}


print_line "1. Install System Updates #########################################"
# update system packages
sudo -E apt-get update -qq > /dev/null

# upgrade system packages
sudo -E apt-get upgrade -qq > /dev/null && sudo -E apt-get dist-upgrade -y > /dev/null


print_line "2. Install Packages ###############################################"
# accept the ttf-mscorefonts-installer EULA ahead of time
sudo -E debconf-set-selections <<< "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true"

# run the package installation script
. ${scripts}/install.sh > /dev/null
cd ${current_directory}


# create commonly required directories
cd ${HOME}
mkdir -p "bin" "Projects" ".icons" ".themes"

# add bin to path
echo "export PATH=${PATH}:${HOME}/bin" | tee --append "${HOME}/.bashrc"

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
