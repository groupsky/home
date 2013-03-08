#!/bin/bash

function get() {
	wget -qO- https://github.com/groupsky/home/raw/master/$1 > ~/$1
}

get .gitconfig
get .bashrc
wget -qO- https://gist.github.com/groupsky/3747983/raw/1475fe951de103397357445af6f7b4aa4e5cb505/51-android.rules | sudo tee /etc/udev/rules.d/51-android.rules > /dev/null
wget -qO- https://gist.github.com/groupsky/3747983/raw/73bebae7b15cdf0477c45a92b0f18ad17f8f28ba/adb_usb.ini > ~/.android/adb_usb.ini

