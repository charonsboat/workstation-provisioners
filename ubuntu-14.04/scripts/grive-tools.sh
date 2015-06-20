#!/usr/bin/env bash


echo "Installing Package: grive-tools"

# add ppa repository
sudo -E add-apt-repository -y ppa:thefanclub/grive-tools > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq grive-tools > /dev/null
