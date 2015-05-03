#!/bin/bash


log="./provision.log"
# Copy STDOUT to a log
exec >  >(tee -a ${log})
# Include STDERR to the same log
exec 2> >(tee -a ${log} >&2)

export DEBIAN_FRONTEND=noninteractive

# using a tmp dir to store any downloaded files or logs
# /var/tmp files are supposed to persist even on reboot
tmp="/var/tmp"

lib="./lib"
conf="./conf"

# Execute the Fix Ubuntu script to ensure additional privacy.
${lib}/fixubuntu.sh

# Retrieve and extract Consolas because it is my favorite programming font.
${lib}/consolas.sh

# load lst-reader function, read_lst()
source ${lib}/utilities.sh


ppas=$(read_lst "${conf}/ppas.lst")
ppa_packages=$(read_lst "${conf}/ppa-packages.lst")
packages=$(read_lst "${conf}/packages.lst")


echo ; echo ;
echo "1. Add Personal Package Archives ========================================"
printf %s "${ppas}" | while read -r ppa || [ -n "${ppa}" ]; do
    echo "Adding Package Archive: ${ppa}"
    add-apt-repository -y ${ppa} > /dev/null
done


echo "Adding Package Archive: VirtualBox"
# Grab the latest version of Virtualbox from the Oracle repository.
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list


echo ; echo ;
echo "2. Refresh Package Archives ============================================="
apt-get update -qq -y > /dev/null


echo ; echo ;
echo "3. Install Updates ======================================================"
apt-get upgrade -qq -y > /dev/null && apt-get dist-upgrade -qq -y > /dev/null


echo ; echo ;
echo "4. Install Selected Packages ============================================"
printf %s "${packages}" | while read -r package || [ -n "${package}" ]; do
    echo "Installing Package: ${package}"
    apt-get install -qq -y ${package} > /dev/null
done


# Accept the ttf-mscorefonts-installer EULA ahead of time
debconf-set-selections <<< "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true"


# Install other Internet/social packages
CHROMESTABLEFILE=google-chrome-stable_current_amd64.deb
wget https://dl.google.com/linux/direct/$CHROMESTABLEFILE | dpkg -i $CHROMESTABLEFILE > /dev/null
rm $CHROMESTABLEFILE


# Create commonly required directories
cd ~/
mkdir bin Projects .icons .themes

cd ~/.icons
git clone https://github.com/NitruxSA/flattr-icons.git
git clone https://github.com/xcjs/flattr-dark.git

cd ~/.themes
git clone https://github.com/wfpaisa/Plane-Gtk3.git
git clone https://github.com/wfpaisa/Plane-Gtk3-White.git

cd ~/
ln -s ./.icons /root/.icons
ln -s ./.themes /root/.themes


# Custom binaries ##############################################################

cd ~/bin

# Android

ANDROIDSTUDIODOWNLOAD=android-studio-ide-135.1740770-linux.zip
ANDROIDSDKDOWNLOAD=android-sdk_r24.1.2-linux.tgz

wget https://dl.google.com/dl/android/studio/ide-zips/1.1.0/$ANDROIDSTUDIODOWNLOAD > /dev/null
unzip $ANDROIDSTUDIODOWNLOAD > /dev/null

wget http://dl.google.com/android/$ANDROIDSDKDOWNLOAD > /dev/null
tar -zxvf $ANDROIDSDKDOWNLOAD > /dev/null

rm $ANDROIDSTUDIODOWNLOAD $ANDROIDSDKDOWNLOAD

# Setup symlinks to make applications executable from path (Ubuntu ~/.profile
# adds ~/bin to path if it exists.

ln -s ./android-studio/bin/studio.sh ./androidstudio
