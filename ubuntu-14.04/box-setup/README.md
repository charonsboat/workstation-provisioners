# vagrant box setup (ubuntu-desktop-14.04-x64)

How to set up a base box with Ubuntu Desktop for use with Vagrant.


## getting the base image

Download the image from [Ubuntu](http://www.ubuntu.com/download/desktop/).


## creating the virtual machine

### VirtualBox:

Create a new virtual machine for Ubuntu:

- Give it a descriptive name. E.g. ubuntu-desktop-14.04-x64
- Choose the default amount of memory. E.g. 512 MB
- Create a new virtual hard drive (.vmdk). Choose dynamically sized and set the max size. E.g. 24 GB


## preparing the base image

On first boot, you will have to select the newly downloaded iso. Continue through the prompts until you get to the "Who are you?" part of the setup. Use the following information to set up the machine:

```
Name:         vagrant
Machine Name: vagrant-box
Username:     vagrant
Password:     vagrant
```

After the installation finishes, run ```setup.sh``` as the vagrant user (not with sudo). It will then ask you to confirm your sudo password on the first command that requires it.

As long as the script executes without any major errors, your machine is ready for packaging!

Note: If you get a "permission denied" error when running the setup script, you may need to enable execute permissions on the file like so:

```bash
chmod +x setup.sh
```
