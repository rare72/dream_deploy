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
yum install curl wget make gcc binutils -y


## Install EPEL
cd /data/INSTALLER/ ; curl -LO  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install /data/INSTALLER/epel-release-latest-7.noarch.rpm -y
ls -lashrt /data/INSTALLER


## Install perl
yum install perl perl-devel -y
# yum install perl-core -y
# yum install perl-libs -y


## Install Python
yum install python-devel python-lxml python-six python-urllib3 PyYaml python python-jinja2 redhat-support-lib-python -y
yum install python-pip python-simplejson -y


## Install Ansible
yum install ansible --verbose -y


## Install Git
# yum install git -y
yum install git-core gnome-keyring -y
git config --global push.default current
git config --global user.useConfigOnly=true
git config --global user.name "Phil Vinson"
git config --global user.email rare72_pv@yahoo.com
git config --global color.status=auto
git config --global color.ui auto
git config --global color.diff=auto
git config --global color.status=auto
git config --global color.branch=auto
git config --global color.interactive=true
git config --global core.symlinks=false
git config --global core.autocrlf=input
git config --global core.fscache=true
git config --global core.repositoryformatversion=0
git config --global core.filemode=false
git config --global core.bare=false
git config --global core.logallrefupdates=true
git config --global core.ignorecase=true
git config --global core.hidedotfiles=dotGitOnly
git config --global credential.helper gnome-keyring
git config --list
### Do not forget to verify the setting's with the "~/.gitconfig" file


## Deploy the dream_deploy repository
cd /data/PROJECTS ; git clone --verbose https://rare72@github.com/rare72/dream_deploy.git


## Install vagrant keys for "root" user
curl -Lo /root/.ssh/authorized_keys https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub
curl -Lo /root/.ssh/vagrant.pub https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub
curl -Lo /root/.ssh/vagrant https://github.com/mitchellh/vagrant/raw/master/keys/vagrant

## Install vagrant keys for "vagrant" user
curl -Lo /home/vagrant/.ssh/authorized_keys https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub
curl -Lo /home/vagrant/.ssh/vagrant.pub https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub
curl -Lo /home/vagrant/.ssh/vagrant https://github.com/mitchellh/vagrant/raw/master/keys/vagrant

## Set System Permission's
chown -R root:root /root/.ssh
chmod 600 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/vagrant
chmod 600 /root/.ssh/vagrant.pub
chmod -Rv 644 /data/PROJECTS/dream_deploy/
chmod -Rv 775 /data/PROJECTS/dream_deploy/*.sh

# chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/vagrant
chmod 600 /home/vagrant/.ssh/vagrant.pub

exit
