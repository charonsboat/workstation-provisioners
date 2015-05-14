#!/usr/bin/env bash


# Android Studio
echo "Installing Package: android-studio"

# make sure we're in the bin directory
mkdir -p "${HOME}/bin"
cd "${HOME}/bin"

# set the version numbers for easier updating. updated version numbers can be found here: https://developer.android.com/sdk/index.html#Other
androidstudio_version=1.2.0.12
androidstudio_file_version=141.1890965

# download the zipped application
wget https://dl.google.com/dl/android/studio/ide-zips/${androidstudio_version}/android-studio-ide-${androidstudio_file_version}-linux.zip -O android-studio.zip > /dev/null

# extract the files
unzip android-studio.zip > /dev/null

# rename the extracted directory name since we're going to symlink the actual binary
mv ./android-studio ./android-studio-bin

# symlink the studio binary into the path as android-studio
ln -s ./android-studio-bin/bin/studio.sh ./android-studio

# clean up
rm android-studio.zip
