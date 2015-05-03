#!/bin/bash

read_lst () {
    printf "%s\n" $(grep -vE "^(\s*$|#)" ${1})
}
