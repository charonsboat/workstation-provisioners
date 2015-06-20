#!/usr/bin/env bash


echo "Installing Package: grive"

# add ppa repository
sudo -E add-apt-repository -y ppa:nilarimogard/webupd8 > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq grive > /dev/null
