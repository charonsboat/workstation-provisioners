#!/usr/bin/env bash

sudo apt-get install -qq font-manager cabextract > /dev/null

set -e
set -x

tmp="${HOME}/.tmp"
fonts="${HOME}/.fonts"

mkdir -p ${tmp}
cd ${tmp}

wget http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe > /dev/null
cabextract -L -F ppviewer.cab PowerPointViewer.exe > /dev/null
cabextract ppviewer.cab > /dev/null

mkdir -p ${fonts}
cp CONSOLA*.TTF ${fonts}

cd ~/
rm -rf ${tmp}
