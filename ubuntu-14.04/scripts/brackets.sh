#!/usr/bin/env bash


echo "Installing Package: brackets"

# add ppa repository
sudo -E add-apt-repository -y ppa:webupd8team/brackets > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq brackets > /dev/null
