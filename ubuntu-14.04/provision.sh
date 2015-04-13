#!/bin/bash

# Execute the Fix Ubuntu script to ensure additional privacy.
./fixubuntu.sh

# Update software channel listings
sudo apt-get update
# OS updates
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# Install "base" packages ######################################################
sudo apt-get install -y xubuntu-desktop ubuntu-restricted-extras

# Switch Plymouth theme from Xubuntu to default 
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u

# Install packages from third party software channels ##########################
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:webupd8team/brackets
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo add-apt-repository -y ppa:jerzy-kozera/zeal-ppa
sudo add-apt-repository ppa:ondrej/php5

sudo apt-get update
sudo apt-get install sublime-text atom brackets remmina zeal lamp-server^

# Install additional PHP related packages/tools ################################

# Install Composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin

# Install Node.js related packages #############################################
sudo apt-get install nodejs nodejs-legacy npm redis-server

# Update npm
sudo npm install -g npm
# Delete the hash for npm since we need bash to find the new version
hash -d npm

# Install commonly used npm packages globally
sudo npm install -g grunt-cli
sudo npm install -g bower
sudo npm install -g sails

# Install other utlities #######################################################

sudo apt-get install kupfer