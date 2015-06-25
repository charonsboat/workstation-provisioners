#!/usr/bin/env bash


# Google Chrome
echo "Installing Package: google-chrome"

# make sure we're in the bin directory
mkdir -p "${HOME}/bin"
cd "${HOME}/bin"

# download the package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb > /dev/null

# install the package
sudo -E dpkg -i google-chrome.deb > /dev/null

# clean up
rm google-chrome.deb
