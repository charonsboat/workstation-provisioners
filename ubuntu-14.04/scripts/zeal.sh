#!/usr/bin/env bash


# Zeal
echo "Installing Package: zeal"

# add ppa repository
sudo -E add-apt-repository -y ppa:zeal-developers/ppa > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq zeal > /dev/null
