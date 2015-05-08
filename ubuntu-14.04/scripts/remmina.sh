#!/usr/bin/env bash


# Remmina Remote Desktop
echo "Installing Package: remmina"

# add ppa repository
sudo -E add-apt-repository -y ppa:remmina-ppa-team/remmina-next > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq remmina > /dev/null
