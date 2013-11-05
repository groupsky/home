#!/bin/bash

function get() {
	curl -fsSL https://github.com/groupsky/home/raw/master/$1 > $HOME/$1
}

function check() {
	command -v "$1" >/dev/null 2>&1
}

if [ "$(uname)" == "Darwin" ]; then
    echo "OS X detected"

    # install homebrew
    check brew || ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    
    # install mc
    check mc || brew install mc

    # install git
    check git || brew install git

    # install wget
    check wget || brew install wget

    # install bash-completion
    brew install bash-completion
    
    # install hub
    check hub || brew install hub
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Linux detected"
    
    # install hub
    check hub || curl http://hub.github.com/standalone -sLo ~/bin/hub
    chmod +x ~/bin/hub

    wget -qO- https://gist.github.com/groupsky/3747983/raw/1475fe951de103397357445af6f7b4aa4e5cb505/51-android.rules | sudo tee /etc/udev/rules.d/51-android.rules > /dev/null
    wget -qO- https://gist.github.com/groupsky/3747983/raw/73bebae7b15cdf0477c45a92b0f18ad17f8f28ba/adb_usb.ini > ~/.android/adb_usb.ini

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo "Windows NT detected"
    
fi

get .gitconfig
get .bashrc
get .profile
get .bash_aliases

