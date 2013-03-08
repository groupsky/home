#!/bin/bash

function get() {
	wget -qO- https://github.com/groupsky/home/raw/master/$1 > ~/$1
}

get .gitconfig
get .bashrc

