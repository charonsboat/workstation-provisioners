#!/bin/bash

#### ADD USER TO SUDOERS FILE ##################################################

# backup sudoers file
sudo cp /etc/sudoers /etc/sudoers.backup

# add current user to sudoers file
sudo grep -q "${USER}[ \t].*" /etc/sudoers && sudo sed -i "s/${USER}[ \t].*/${USER} ALL=(ALL) NOPASSWD: ALL/g" /etc/sudoers || echo "${USER} ALL=(ALL) NOPASSWD: ALL" | sudo tee --append /etc/sudoers > /dev/null


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

# backup ssh configuration
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# configure ssh
sudo grep -q "#\?Port[ \t].*" /etc/ssh/sshd_config && sudo sed -i "s/#\?Port[ \t].*/Port 22/g" /etc/ssh/sshd_config || echo "Port 22" | sudo tee --append /etc/ssh/sshd_config > /dev/null
sudo grep -q "#\?PubkeyAuthentication[ \t].*" /etc/ssh/sshd_config && sudo sed -i "s/#\?PubkeyAuthentication[ \t].*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config || echo "PubkeyAuthentication yes" | sudo tee --append /etc/ssh/sshd_config > /dev/null
sudo grep -q "#\?AuthorizedKeysFile[ \t].*" /etc/ssh/sshd_config && sudo sed -i "s/#\?AuthorizedKeysFile[ \t].*/AuthorizedKeysFile %h\/.ssh\/authorized_keys/g" /etc/ssh/sshd_config || echo "AuthorizedKeysFile %h/.ssh/authorized_keys" | sudo tee --append /etc/ssh/sshd_config > /dev/null
sudo grep -q "#\?PermitEmptyPasswords[ \t].*" /etc/ssh/sshd_config && sudo sed -i "s/#\?PermitEmptyPasswords[ \t].*/PermitEmptyPasswords no/g" /etc/ssh/sshd_config || echo "PermitEmptyPasswords no" | sudo tee --append /etc/ssh/sshd_config > /dev/null

# add Vagrant public key
mkdir -p "${HOME}/.ssh"
wget "https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub" -O - | - >> "${HOME}/.ssh/authorized_keys" > /dev/null

# make sure permissions and ownership are correct
chmod -R 0700 "${HOME}/.ssh"
chmod -R 0600 "${HOME}/.ssh/authorized_keys"
chown -R "${USER}" "${HOME}/.ssh"

# apply the updates to configuration
sudo service ssh restart
