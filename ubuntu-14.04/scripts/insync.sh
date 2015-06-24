#!/usr/bin/env bash


# Insync
echo "Installing Package: insync"

# make sure we're in the bin directory
mkdir -p "${HOME}/bin"
cd "${HOME}/bin"

# grab the latest version of insync from the insynchq repository.
wget -q https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key -O - | sudo apt-key add - > /dev/null

# add the insync reference to the sources directory
echo "deb http://apt.insynchq.com/ubuntu $(lsb_release -cs) non-free contrib" | sudo tee --append /etc/apt/sources.list.d/insync.list

# update packages repository
sudo -E apt-get update -qq > /dev/null

# install the package
sudo -E apt-get install -qq insync > /dev/null
