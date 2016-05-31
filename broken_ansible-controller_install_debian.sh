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
mkdir -p -m 777 /data/INSTALLER
mkdir -p -m 777 /data/data_app/keys/bad_archive
mkdir -p -m 777 /data/data_app/ansible
mkdir -p -m 700 /root/.ssh/


## Setup Enviornment variables
## Create a standard enviornment file
{ date -u ; uname -n ;} > /data/logs/vagrant_box_build_time
{ date -u ; uname -n ;} > /data/logs/MASTER_NODE

## Update Available Packages
apt-get update -y


## Install Important System Packages
apt-get install vim-tiny curl wget make gcc-4.9-base binutils build-essential sysv-rc uuid-runtime linux-headers-$(uname -r)

## Install Python
apt-get install python2.7 python-pip python2.7-dev python-simplejson python-yaml

apt-get install python-crypto python-markupsafe python-six python-requests python-urllib3 python-wheel

# apt-get install python-subversion

apt-get install python-doc python-tk python-dev python-cryptography-doc python-cryptography-vectors python-genshi python-lxml python-openssl-doc python-openssl-dbg python-distribute python-distribute-doc python-ply-doc doc-base python2.7-doc python-crypto-dbg python-crypto-doc

pip2.7 install setuptools
pip2.7 install Jinja2 httplib2 ecdsa
# pip install paramiko PyYAML Jinja2 httplib2 six pycrypto Markupsafe setuptools requests ecdsa mercurial subversion git --upgrade
pip2.7 install mercurial bazaar setuptools


##Install Ansible
pip2.7 install ansible --verbose


## Install Git
apt-get install git-core -y
git config --global user.name "Phil Vinson"
git config --global user.email rare72_pv@yahoo.com
git config color.status=auto
git config color.branch=auto
git config color.interactive=auto
git config --global push.default current
git config --list
### Do not forget to verify the setting's with the "~/.gitconfig" file


## Deploy the dream_deploy repository
cd /data/PROJECTS
git clone --verbose https://github.com/rare72/dream_deploy.git


## Install vagrant keys
curl -Lo /root/.ssh/authorized_keys https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub
curl -Lo /root/.ssh/vagrant.pub https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub
curl -Lo /root/.ssh/vagrant https://github.com/mitchellh/vagrant/raw/master/keys/vagrant


## Set System Permission's
chown -R root:root /root/.ssh
chmod 600 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/vagrant
chmod 600 /root/.ssh/vagrant.pub
chmod -Rv 644 /data/PROJECTS/dream_deploy/
chmod -Rv 775 /data/PROJECTS/dream_deploy/*.sh

exit
