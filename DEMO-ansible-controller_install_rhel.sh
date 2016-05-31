#!/bin/bash

### This Script is used to setup the Ansible Controller and the associated enviornment.
### Install Ansible

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
yum install update

## Install "net-tools"
yum install net-tools

## Install Important System Packages
yum install vim-enhanced
yum install kernel-headers kernel-devel glibc glibc-devel
yum install git curl wget make gcc binutils

## Install EPEL
cd /data/INSTALLER/ ; curl -LO  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install /data/INSTALLER/epel-release-latest-7.noarch.rpm3
ls -lashrt /data/INSTALLER


## Install perl
yum install perl perl-devel
# yum install perl-core
# yum install perl-libs


## Install Python
yum install python-devel python-lxml python-six python-urllib3 PyYaml python python-jinja2 redhat-support-lib-python
yum install python-pip python-simplejson


##Install Ansible
yum install ansible --verbose


## Install Git
yum install git-core
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
ls -lashrt cd /data/PROJECTS

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
