# vagrant box setup (ubuntu-desktop-14.04-x64)

How to set up a [base box with Ubuntu Desktop](https://atlas.hashicorp.com/drmyersii/boxes/ubuntu-desktop-14.04-x64) for use with Vagrant.


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

After the installation finishes, run these commands to download and run the script:

```bash
# download the script
wget https://raw.githubusercontent.com/drmyersii/workstation-provisioners/master/ubuntu-14.04/box-setup/setup.sh -O "${HOME}/setup.sh"

# run the script as the base user
~/setup.sh
```

It will then ask you to confirm your sudo password on the first command that requires it. The script outputs all of stdout and stderr to a log file located at ```${HOME}/box-setup.log```As long as the script executes without any major errors, your machine is ready for packaging!

Note: If you get a "permission denied" error when running the setup script, you may need to enable execute permissions on the file like so:

```bash
chmod +x setup.sh
```

### cleaning up your leftover files

After the setup script runs and the vm reboots, you can remove the two created files with this command:

```bash
rm "${HOME}/box-setup.log" "${HOME}/setup.sh"
```

You may want to clear your bash history as well, and you can simply do that with the following commands:

```bash
history -c && history -w
```


## packaging your box

Now that your box is ready for packaging, all you have to do is make sure your machine is off, and then run the following command:

```
vagrant package --base ubuntu-desktop-14.04-x64
```

That's it! You now have a box packaged and ready to use with VirtualBox!
