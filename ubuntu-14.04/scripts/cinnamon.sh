#!/usr/bin/env bash


echo "Installing Package: cinnamon"

# add ppa repository
sudo -E add-apt-repository -y ppa:tsvetko.tsvetkov/cinnamon > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq cinnamon > /dev/null
