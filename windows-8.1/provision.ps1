# PowerShell
# set execution policy unrestricted for the chocolately install
Set-ExecutionPolicy Unrestricted
(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

# install cygwin first to get our bash tools
choco install cygwin

# launch cygwin
cygwin

# install apt-cyg to make it easy to install new packages
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin
rm -rf ./apt-cyg

# install some necessary tools
apt-cyg install wget tar bzip2 git git-svn subversion vim openssh openssl ca-certificates screen bash-completion curl rsync

# fix vim
touch ~/.vimrc
echo "set nocompatible" >> ~/.vimrc
echo "set nocp" >> ~/.vimrc
echo "set backspace=indent,eol,start" >> ~/.vimrc

# set vim as the default editor
cp ~/.bashrc ~/.bashrc.backup
echo "export VISUAL=vim" >> ~/.bashrc
echo "export EDITOR=\"$VISUAL\"" >> ~/.bashrc
