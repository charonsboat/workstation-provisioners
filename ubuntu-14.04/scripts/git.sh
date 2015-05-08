#!/usr/bin/env bash


echo "Installing Package: git"

# add ppa repository
sudo -E add-apt-repository -y ppa:git-core/ppa > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq git > /dev/null
