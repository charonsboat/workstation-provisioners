# vagrant box setup (windows-8.1-x64)

How to set up a [base box with Windows Professional]() for use with Vagrant.


## getting the base image

Download the evaluation image from [TechNet](http://www.microsoft.com/en-us/evalcenter). Click the "Evaluate Now" dropdown and choose the OS version you want to use.

Alternatively, you can use your own copy of Windows if you have a license.


## creating the virtual machine

### VirtualBox:

Create a new virtual machine for Windows:

- Give it a descriptive name. E.g. windows-8.1-x64
- Choose the default amount of memory. E.g. 2048 MB
- Create a new virtual hard drive (.vmdk). Choose dynamically sized and set the max size. E.g. 48 GB


## preparing the base image

On first boot, you will have to select the newly downloaded iso. Use the following information to set up the machine:

```
Machine Name: vagrant-box
Username:     vagrant
Password:     vagrant
Hint:         hint
```

After the installation finishes, install Guest Additions, run the Windows Updates, and then run the setup script like so:

```powershell
# download the script
wget https://raw.githubusercontent.com/drmyersii/workstation-provisioners/master/windows-8.1/box-setup/setup.ps1

# run the script
./setup.ps1
```
