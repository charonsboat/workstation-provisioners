# ubuntu 14.04

This provisioning script will install everything in the ```install.sh``` file under the scripts directory. If any of the applications in the install script have a corresponding script file, that script will be run instead of just using apt-get. This provisioning script was originally forked from [xcjs's ubuntu 14.04 provisioning script](https://github.com/xcjs/workstation-provision/tree/master/ubuntu-14.04) but has changed tremendously.


## usage

Download the repository and run the ```provision.sh``` script like so:

```bash
git clone https://github.com/drmyersii/workstation-provisioners.git
cd ubuntu-14.04
./provision.sh
```

It will prompt you for your sudo password.

Note: If you get a "permission denied" error when running the provisioning script, you may need to enable execute permissions on the file like so:

```bash
chmod +x setup.sh
```


## development

If you would like to work on and test this script, make sure you have Vagrant, VirtualBox, and Git installed. Then run:

```bash
git clone https://github.com/drmyersii/workstation-provisioners.git
cd ubuntu-14.04
vagrant up
```
