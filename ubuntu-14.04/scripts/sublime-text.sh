#!/usr/bin/env bash


# Sublime Text 2
echo "Installing Package: sublime-text"

# add ppa repository
sudo -E add-apt-repository -y ppa:webupd8team/sublime-text-2 > /dev/null

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq sublime-text > /dev/null
