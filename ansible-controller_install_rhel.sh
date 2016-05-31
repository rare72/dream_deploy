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
yum install update -y

## Install "net-tools"
yum install net-tools -y

## Install Important System Packages
yum install vim-enhanced -y
yum install kernel-headers kernel-devel glibc glibc-devel -y
yum install git curl wget make gcc binutils -y

## Install EPEL
cd /data/INSTALLER/ ; curl -LO  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install epel-release -y
ls -lashrt /data/INSTALLER


## Install perl
yum install perl perl-devel -y
# yum install perl-core -y
# yum install perl-libs -y


## Install Python
yum install python-devel python-lxml python-six python-urllib3 PyYaml python python-jinja2 redhat-support-lib-python -y
yum install python-pip python-simplejson -y


##Install Ansible
yum install ansible --verbose -y


## Install Git
yum install git-core -y
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
