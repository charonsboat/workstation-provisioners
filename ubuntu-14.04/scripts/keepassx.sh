#!/usr/bin/env bash


# KeePass X
echo "Installing Package: keepassx"

# add ppa repository
sudo -E add-apt-repository -y ppa:keepassx/daily > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq keepassx > /dev/null
