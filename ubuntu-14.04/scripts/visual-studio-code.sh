#!/usr/bin/env bash


# Visual Studio - Code Edition
echo "Installing Package: visual-studio-code"

# make sure we're in the bin directory
mkdir -p "${HOME}/bin"
cd "${HOME}/bin"

# download the zipped application
wget http://go.microsoft.com/fwlink/?LinkID=534108 -O visual-studio-code.zip > /dev/null

# extract the files into a new directory
unzip visual-studio-code.zip -d ./visual-studio-code-bin > /dev/null

# symlink the binary into the path as visual-studio-code
ln -s ./visual-studio-code-bin/Code ./visual-studio-code

# clean up
rm visual-studio-code.zip
