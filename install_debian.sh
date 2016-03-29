#!/bin/bash

# Update Available Packages
apt-get update

# Install Important System Packages
apt-get install make gcc linux-headers-amd64

# Install Git
apt-get install git-core
git config --global user.name "Phil Vinson"
git config --global user.email rare72_pv@yahoo.com
git config --list
###Do not forget to configure the "~/.gitconfig" file ###

# Install Ansible
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible

exit
