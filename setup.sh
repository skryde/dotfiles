#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

printf "'stow' exists? "
if which stow > /dev/null 2> /dev/null; then
    echo -e "\e[32m\xE2\x9C\x94\e[39m"

else
    echo -e "\e[31m\xE2\x9D\x8C\e[39m"
    exit 1
fi

printf "Stowing stow   "

cd $SCRIPTPATH && echo "--target=${HOME}" > stow/.stowrc
stow stow
echo -e "\e[32m\xE2\x9C\x94\e[39m"
