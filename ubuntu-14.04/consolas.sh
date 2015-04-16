#!/bin/sh

sudo apt-get install font-manager cabextract

set -e
set -x

TEMPPATH='powerpointviewertmp/'

mkdir -p $TEMPPATH
cd $TEMPPATH

wget http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe
cabextract -L -F ppviewer.cab PowerPointViewer.exe
cabextract ppviewer.cab

mkdir -p ~/.fonts

cp CONSOLA*.TTF ~/.fonts/

cd ../
rm -r $TEMPPATH
