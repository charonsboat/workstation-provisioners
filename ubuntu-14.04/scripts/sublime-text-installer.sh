#!/usr/bin/env bash


# Sublime Text 3
echo "Installing Package: sublime-text-installer"

# add ppa repository
sudo -E add-apt-repository -y ppa:webupd8team/sublime-text-3 > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq sublime-text-installer > /dev/null
