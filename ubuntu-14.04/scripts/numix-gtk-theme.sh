#!/usr/bin/env bash


# Numix GTK Theme
echo "Installing Package: numix-gtk-theme"

# add ppa repository
sudo -E add-apt-repository -y ppa:numix/ppa > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq numix-gtk-theme > /dev/null
