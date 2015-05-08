#!/usr/bin/env bash


# Notfiy OSD
echo "Installing Package: notifyosdconfig"

# add customizable notifyosd
sudo -E add-apt-repository -y ppa:leolik/leolik

# add ppa repository for gui
sudo -E add-apt-repository -y ppa:amandeepgrewal/notifyosdconfig > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# upgrade packages
sudo -E apt-get upgrade -qq > /dev/null

# install the package
sudo -E apt-get install -qq notifyosdconfig > /dev/null
