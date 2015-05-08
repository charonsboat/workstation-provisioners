#!/bin/bash


# print formatted line to terminal
# @param 1: statement
print_line () {
    printf ""
    printf ""
    printf "#### ${1}"
    printf ""
}

# install specified package with package script; fall back to apt
# @param 1: /path/to/scripts
# @param 2: package-name
install_package () {
    if [ -f "${1%/}/${2}.sh" ]; then
        print_line "Running Install Script for Package: ${2}"

        . ${1%/}/${2}.sh
    else
        sudo apt-get install -qq ${2} > /dev/null
    fi
}
