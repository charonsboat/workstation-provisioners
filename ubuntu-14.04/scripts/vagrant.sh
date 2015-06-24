#!/usr/bin/env bash


# Vagrant
echo "Installing Package: vagrant"

# make sure we're in the bin directory
mkdir -p "${HOME}/bin"
cd "${HOME}/bin"

# set the version number for easier updating
vagrant_version=1.7.2

# download updated version of the package
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_${vagrant_version}_x86_64.deb -O vagrant.deb > /dev/null

# install the package
sudo -E dpkg -i vagrant.deb > /dev/null

# clean up
rm vagrant.deb


# Vagrant Plugin: vagrant-linode
vagrant plugin install vagrant-linode

# Vagrant Plugin: vagrant-digitalocean
vagrant plugin install vagrant-digitalocean
