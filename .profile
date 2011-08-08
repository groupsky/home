# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# include local gems to PATH
if [ -d "$HOME/.gem/ruby/1.8/bin" ]; then
    PATH="$HOME/.gem/ruby/1.8/bin:$PATH"
fi

# define android home
if [ -d "$HOME/opt/android-sdk-linux_x86" ]; then
    ANDROID_HOME="$HOME/opt/android-sdk-linux_x86"
    # include android tools to PATH
    PATH="$ANDROID_HOME/tools:$PATH"
fi

# include global gems to PATH
if [ -d "/var/lib/gems/1.8/bin" ]; then
    PATH="$PATH:/var/lib/gems/1.8/bin"
fi

