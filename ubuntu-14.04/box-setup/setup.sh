#!/bin/bash

#### RUN SYSTEM UPDATES ########################################################

# update the system
sudo apt-get update -y

# install updates
sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y


#### INSTALL GUEST ADDITIONS ###################################################

# prepare for guest additions install
sudo apt-get install -y linux-headers-generic build-essential dkms

# make sure this matches your virtualbox version
vb_version=4.3.26

# download guest additions iso
wget http://download.virtualbox.org/virtualbox/${vb_version}/VBoxGuestAdditions_${vb_version}.iso

# mount the new iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_${vb_version}.iso /media/VBoxGuestAdditions

# run the install
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run

# unmount the iso
sudo unmount /media/VBoxGuestAdditions

# clean up
sudo rmdir /media/VBoxGuestAdditions
rm VBoxGuestAdditions_${vb_version}.iso


#### SET UP SSH SERVER #########################################################

# install openssh
sudo apt-get install -y openssh-server

# configure ssh
sudo grep -q "^#\?Port[ \t].*" /etc/ssh/sshd_config && sudo sed -i "s/#\?Port[ \t].*/Port 22/g" /etc/ssh/sshd_config || sudo echo "Port 22" >> /etc/ssh/sshd_config
sudo grep -q "^#\?PubkeyAuthentication[ \t].*" /etc/ssh/sshd_config && sudo sed -i "s/#\?PubkeyAuthentication[ \t].*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config || sudo echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
sudo grep -q "^#\?AuthorizedKeysFile[ \t].*" /etc/ssh/sshd_config && sudo sed -i "s/#\?AuthorizedKeysFile[ \t].*/AuthorizedKeysFile %h\/.ssh\/authorized_keys/g" /etc/ssh/sshd_config || sudo echo "AuthorizedKeysFile %h/.ssh/authorized_keys" >> /etc/ssh/sshd_config
sudo grep -q "^#\?PermitEmptyPasswords[ \t].*" /etc/ssh/sshd_config && sudo sed -i "s/#\?PermitEmptyPasswords[ \t].*/PermitEmptyPasswords no/g" /etc/ssh/sshd_config || sudo echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config
