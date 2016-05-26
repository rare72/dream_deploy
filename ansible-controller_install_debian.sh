#!/bin/bash

### This Script is used to setup the Ansible Controller and the associated enviornment.
## Set up the directory structure within the enviornment.
mkdir -p -m 777 /data/logs
mkdir -p -m 777 /data/logs/ansible
mkdir -p -m 777 /data/logs/dhcp
mkdir -p -m 777 /data/logs/dns
mkdir -p -m 777 /data/logs/vagrant
mkdir -p -m 777 /data/tmp
mkdir -p -m 777 /data/PROJECTS
mkdir -p -m 777 /data/data_app/keys/bad_archive
mkdir -p -m 777 /data/data_app/ansible
mkdir -p -m 640 /root/.ssh/


## Setup Enviornment variables
## Create a standard enviornment file
{ date -u ; uname -n ;} > /data/logs/vagrant_box_build_time
{ date -u ; uname -n ;} > /data/logs/MASTER_NODE

## Update Available Packages
apt-get update -y


## Install Important System Packages
apt-get install vim-tiny curl wget make gcc-4.9-base binutils python build-essential linux-headers-$(uname -r) sysv-rc rcconf -y
apt-get install python-pip python-dev python-simplejson python-yaml python-gmpy -y
pip install paramiko PyYAML Jinja2 httplib2 six pycrypto Markupsafe --upgrade


##Install Ansible
pip install ansible


## Install Git
apt-get install git-core -y
git config --global user.name "Phil Vinson"
git config --global user.email rare72_pv@yahoo.com
git config --list
### Do not forget to verify the setting's with the "~/.gitconfig" file


## Deploy the dream_deploy repository
cd /data/PROJECTS
git clone --verbose https://github.com/rare72/dream_deploy.git


## Post Ansible Install


# Install vagrant keys
curl -Lo /root/.ssh/authorized_keys https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
curl -Lo /root/.ssh/vagrant.pub https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
curl -Lo /root/.ssh/vagrant_private https://raw.githubusercontent.com/rare72/vagrant/master/keys/vagrant

chmod 0600 /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/vagrant_private
chmod 0600 /root/.ssh/vagrant.pub
chown -R root:root /root/.ssh


exit
