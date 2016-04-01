#!/bin/bash

# Update Available Packages
apt-get update -yV

# Install Important System Packages
apt-get install vim curl wget make gcc linux-headers-amd64 binutils python -yV

# Install Git
apt-get install git-core -yV
git config --global user.name "Phil Vinson"
git config --global user.email rare72_pv@yahoo.com
git config --list
###Do not forget to configure the "~/.gitconfig" file ###

# Install Ansible
apt-get install software-properties-common python-pip python-dev -yV
pip install -V ansible
pip install -V --upgrade setuptools requests ecdsa markupsafe

exit