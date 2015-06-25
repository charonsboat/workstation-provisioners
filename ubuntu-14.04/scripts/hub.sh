#!/usr/bin/env bash


# Hub for GitHub
echo "Installing Package: hub"

# make sure we're in the bin directory
mkdir -p "${HOME}/bin"
cd "${HOME}/bin"

# set the version number for easier updating
hub_version=2.2.1

# download the packaged application
wget https://github.com/github/hub/releases/download/v${hub_version}/hub-linux-amd64-${hub_version}.tar.gz -O hub.tar.gz > /dev/null

# create the new bin dir for this application
mkdir "hub-bin"

# decompress and untar the application binaries
tar -zxf hub.tar.gz --directory hub-bin --strip-components=1 > /dev/null

# symlink the binary into the path as visual-studio-code
ln -s ./hub-bin/hub ./hub

# clean up
rm hub.tar.gz
