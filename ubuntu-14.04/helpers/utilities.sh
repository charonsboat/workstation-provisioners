#!/usr/bin/env bash


# print formatted line to terminal
# @param 1: statement
print_line () {
    echo ""
    echo ""
    echo "#### ${1}"
    echo ""
}

# install specified package with package script; fall back to apt
# @param 1: /path/to/scripts
# @param 2: package-name
install_package () {
    if [ -f "${1%/}/${2}.sh" ]; then
        echo "Running Install Script for Package: ${2}"

        . ${1%/}/${2}.sh
    else
        echo "Installing Package: ${2}"

        sudo apt-get install -qq ${2} > /dev/null
    fi
}
