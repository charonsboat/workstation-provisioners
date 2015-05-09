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

# run the package installation script
. ${scripts}/install.sh


echo "Adding Package Archive: VirtualBox"
# grab the latest version of virtualbox from the oracle repository.
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O - | sudo apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee --append /etc/apt/sources.list.d/virtualbox.list


echo ; echo ;
echo "==== 2. Refresh Package Archives ========================================"
sudo -E apt-get update -y > /dev/null


echo ; echo ;
echo "==== 3. Install Updates ================================================="
sudo -E apt-get upgrade -y > /dev/null && sudo -E apt-get dist-upgrade -y > /dev/null


# accept the ttf-mscorefonts-installer EULA ahead of time
sudo debconf-set-selections <<< "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true"


# create commonly required directories
cd ~/
mkdir -p "bin" "Projects" ".icons" ".themes"

# download icon packs
cd ~/.icons
git clone https://github.com/NitruxSA/flattr-icons.git
git clone https://github.com/xcjs/flattr-dark.git

# download themes
cd ~/.themes
git clone https://github.com/wfpaisa/Plane-Gtk3.git
git clone https://github.com/wfpaisa/Plane-Gtk3-White.git

# symlink the themes and icon packs into root directories
cd ~/
sudo ln -s ./.icons /root/.icons
sudo ln -s ./.themes /root/.themes
