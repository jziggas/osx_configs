#!/bin/bash
mv ~/.bashrc ~/.bashrc_old
mv ~/.bash_profile ~/.bash_profile_old
mv ~/.gitconfig ~/.gitconfig_old

ln -s .bashrc ~/.bashrc
ln -s .bash_profile ~/.bash_profile
ln -s .gitconfig ~/.gitconfig

ln -s bin ~/bin
