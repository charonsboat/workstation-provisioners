# ubuntu 14.04

This provisioning script has been forked from [xcjs's ubuntu 14.04 provisioning script](https://github.com/xcjs/workstation-provision/tree/master/ubuntu-14.04).


## usage

Download and run the ```provision.sh``` script like so:

```bash
wget https://raw.githubusercontent.com/drmyersii/workstation-provisioners/master/ubuntu-14.04/consolas.sh
wget https://raw.githubusercontent.com/drmyersii/workstation-provisioners/master/ubuntu-14.04/fixubuntu.sh
wget https://raw.githubusercontent.com/drmyersii/workstation-provisioners/master/ubuntu-14.04/provision.sh | bash
```

or if you have Git:

```bash
git clone https://github.com/drmyersii/workstation-provisioners.git
cd ubuntu-14.04
./provision.sh
```

It will prompt you for your sudo password.


## development

If you would like to work on and test this script, make sure you have Vagrant, VirtualBox, and Git installed. Then run:

```bash
git clone https://github.com/drmyersii/workstation-provisioners.git
cd ubuntu-14.04
vagrant up
```
