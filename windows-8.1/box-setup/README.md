# vagrant box setup

How to set up a Windows Guest for use in Vagrant.


## getting the base image

Download evaluation image from [TechNet](http://www.microsoft.com/en-us/evalcenter). Click the "Evaluate Now" dropdown and choose the OS version you want to use.


## creating the virtual machine

### VirtualBox:

Create a new virtual machine with the downloaded ```.iso``` file.


## setting up the Windows basics

- Enter a PC name. I am using "vagrant-box" as my PC name (the username can not be the same as the PC name).
- When prompted to sign in, click "Create New Account", and then click "Sign In Without A Microsoft Account".
- Enter "vagrant" as the username and the password of the new account. You will have to enter a hint as well, and you can just set it to anything (as long as it doesn't contain the password).
- Install Guest Additions (VirtualBox only)
