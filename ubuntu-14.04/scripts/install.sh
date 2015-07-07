#!/usr/bin/env bash


# packages to be installed
# note: packages will be installed in this order
packages=(

    # System Utilities
    cinnamon
    fluxgui
    gksu
    gnome-tweak-tool
    network-manager-openvpn-gnome
    notifyosdconfig
    numix-gtk-theme
    numix-icon-theme-circle
    numix-wallpaper-notd
    ppa-purge
    ubuntu-restricted-extras
    unity-tweak-tool

    # Command Line Utilities
    htop
    realpath
    screen
    w3m

    # Services
    openssh-server

    # Development Tools
    android-studio
    atom
    brackets
    build-essential
    codeblocks
    filezilla
    git git-svn hub
    meld
    monodevelop
    monodoc-manual
    openjdk-7-jdk openjdk-7-jre
    sublime-text
    subversion
    vagrant
    vim
    virtualbox
    visual-studio-code
    zeal

    # Graphics
    gimp
    inkscape

    # Media
    audacious
    audacity
    vlc

    # Other Utilities
    conduit
    consolas
    google-chrome
    insync
    keepassx
    p7zip-full
    remmina
    typecatcher

)


for i in ${packages[@]}
do
    install_package ${scripts} ${i}
done
