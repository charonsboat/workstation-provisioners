#!/usr/bin/env bash


# VirtualBox
echo "Installing Package: virtualbox"

# make sure we're in the bin directory
mkdir -p "${HOME}/bin"
cd "${HOME}/bin"

# set the version number for easier updating
vb_version=4.3

# grab the latest version of virtualbox from the oracle repository.
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O - | sudo apt-key add - > /dev/null

# add the virtualbox reference to the sources directory
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee --append /etc/apt/sources.list.d/virtualbox.list

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq virtualbox-${vb_version} > /dev/null
