#!/usr/bin/env bash


echo "Installing Package: atom"

# add ppa repository
sudo -E add-apt-repository -y ppa:webupd8team/atom > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq atom > /dev/null
