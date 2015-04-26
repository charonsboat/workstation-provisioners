#!/bin/bash

LOGNAME=provision.log
# Copy STDOUT to a log
exec >  >(tee -a $LOGNAME)
# Include STDERR to the same log
exec 2> >(tee -a $LOGNAME >&2)

export DEBIAN_FRONTEND=noninteractive

# Execute the Fix Ubuntu script to ensure additional privacy.
./fixubuntu.sh

# Retrieve and extract Consolas because it is my favorite programming font.
./consolas.sh

# Update software channel listings
sudo apt-get update
# OS updates
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# Install "base" packages ######################################################

# Accept the ttf-mscorefonts-installer EULA ahead of time
sudo debconf-set-selections <<< "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true"
sudo apt-get install -y gksu ubuntu-restricted-extras unity-tweak-tool gnome-tweak-tool network-manager-openvpn-gnome

# Install packages from third party software channels ##########################
sudo add-apt-repository -y ppa:tsvetko.tsvetkov/cinnamon
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:webupd8team/brackets
sudo apt-add-repository -y ppa:remmina-ppa-team/remmina-next
sudo add-apt-repository -y ppa:jerzy-kozera/zeal-ppa
sudo add-apt-repository -y ppa:ondrej/php5
sudo add-apt-repository -y ppa:minecraft-installer-peeps/minecraft-installer
# The following two install a custom libnotify-bin and configuration tool
sudo add-apt-repository -y ppa:leolik/leolik
sudo add-apt-repository -y ppa:amandeepgrewal/notifyosdconfig
# Grab the latest version of Virtualbox from the Oracle repository.
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list'

sudo apt-get update

# Set MySQL password ahead of time for unattended install
sudo -E apt-get -q -y install mysql-server

sudo apt-get install -y cinnamon sublime-text atom brackets remmina zeal lamp-server^ minecraft-installer virtualbox-4.3

sudo apt-get install -y libnotify-bin notifyosdconfig
pkill notifyosd
# NotifyOSD will show as an upgrade to an existing package.
sudo apt-get upgrade -y

# Install development tools ####################################################

sudo apt-get install -y tilda build-essential git git-svn subversion meld monodevelop monodoc-manual codeblocks vagrant mysql-workbench filezilla
sudo vagrant plugin install vagrant-linode

sudo apt-get install openjdk7-jdk openjdk7-jre

# Install command line utilities I use #########################################

sudo apt-get install -y screen realpath htop w3m nano

# Install additional services ##################################################

sudo apt-get install -y openssh-server

# Install additional PHP related packages/tools ################################

sudo apt-get install -y php5-cli

# Install Composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin
echo "alias composer='php /usr/local/bin/composer.phar'" >> ~/.bashrc
source ~/.bashrc

# Install Node.js related packages #############################################
sudo apt-get install -y nodejs nodejs-legacy npm redis-server

# Update npm
sudo npm install -g npm

# Install commonly used npm packages globally
sudo npm install -g grunt-cli
sudo npm install -g bower
sudo npm install -g sails

# Install other utlities #######################################################

sudo apt-get install -y kupfer keepassx conduit owncloud-client p7zip-full compizconfig-settings-manager compiz-plugins

# Install graphics utilities ###################################################

sudo apt-get install -y gimp inkscape krita rawtherapee

# Install other Internet/social packages

CHROMESTABLEFILE=google-chrome-stable_current_amd64.deb
wget https://dl.google.com/linux/direct/$CHROMESTABLEFILE | sudo dpkg -i $CHROMESTABLEFILE
rm $CHROMESTABLEFILE 

sudo apt-get install -y pidgin midori

# Install media packages #######################################################

sudo apt-get install -y audacious vlc audacity

# Create commonly required directories

cd ~/
mkdir bin Projects src www .icons .themes
mkdir -p Pictures/UI

# UI configuration settings ####################################################

# Install the Numix theme resources since I use elements of that particular theme.
sudo add-apt-repository -y ppa:numix/ppa
sudo apt-get update
sudo apt-get install -y numix-gtk-theme numix-icon-theme-circle install numix-wallpaper-notd

cd ~/.icons
git clone https://github.com/NitruxSA/flattr-icons.git
git clone https://github.com/xcjs/flattr-dark.git

cd ~/.themes
git clone https://github.com/wfpaisa/Plane-Gtk3.git
git clone https://github.com/wfpaisa/Plane-Gtk3-White.git

cd ~/

sudo ln -s ~/.icons /root/.icons
sudo ln -s ~/.themes /root/.themes 

# Custom binaries ##############################################################

cd ~/bin

# JetBrains

INTELLIJDOWNLOAD=ideaIU-14.1.2.tar.gz
PHPSTORMDOWNLOAD=PhpStorm-8.0.3.tar.gz

INTELLIJINSTALL=intellij-ide
PHPSTORMINSTALL=phpstorm-ide

wget https://download.jetbrains.com/idea/$INTELLIJDOWNLOAD
mkdir $INTELLIJINSTALL
tar -zxvf ideaIU-14.1.2.tar.gz --strip-components=1 -C intellij-ide

wget https://download.jetbrains.com/webide/$PHPSTORMDOWNLOAD
mkdir $PHPSTORMINSTALL
tar -zxvf $PHPSTORMDOWNLOAD --strip-components=1 -C phpstorm-ide

rm $INTELLIJDOWNLOAD $PHPSTORMDOWNLOAD

# Android

ANDROIDSTUDIODOWNLOAD=android-studio-ide-135.1740770-linux.zip
ANDROIDSDKDOWNLOAD=android-sdk_r24.1.2-linux.tgz

wget https://dl.google.com/dl/android/studio/ide-zips/1.1.0/$ANDROIDSTUDIODOWNLOAD
unzip $ANDROIDSTUDIODOWNLOAD

wget http://dl.google.com/android/$ANDROIDSDKDOWNLOAD
tar -zxvf $ANDROIDSDKDOWNLOAD

rm $ANDROIDSTUDIODOWNLOAD $ANDROIDSDKDOWNLOAD

# Setup symlinks to make applications executable from path (Ubuntu ~/.profile
# adds ~/bin to path if it exists.

cd ~/bin
ln -s intellij-ide/bin/idea.sh intellij
ln -s phpstorm-ide/bin/phpstorm.sh phpstorm
ln -s android-studio/bin/studio.sh androidstudio
