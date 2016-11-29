#!/bin/bash

BASE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

rm ~/.bashrc
rm ~/.bash_profile
rm ~/.gitconfig
rm -rf ~/bin

ln -s $BASE_DIR/.bashrc ~/.bashrc
ln -s $BASE_DIR/.bash_profile ~/.bash_profile
ln -s $BASE_DIR/.gitconfig ~/.gitconfig

ln -s $BASE_DIR/bin ~/bin
