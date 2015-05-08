#!/usr/bin/env bash


# F.lux
echo "Installing Package: fluxgui"

# add ppa repository
sudo -E add-apt-repository -y ppa:kilian/f.lux > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq fluxgui > /dev/null
