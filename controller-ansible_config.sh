#!/bin/bash

# Clone the Repositories

# Log the creation of the Master Node
{ date -u ; uname -n ;} > /data/logs/MASTER_NODE_INFO
{ uname -n ;} > /data/logs/MASTER_NODE.`date "+%Y%m%d"`

# Preliminary setup of Enviornment Variables
echo $ANSIBLE_CONFIG=$dream_data/ansible.cfg
echo $dream_data=/data/PROJECTS/dream_deploy
echo $ANSIBLE_HOST_KEY_CHECKING=False

# Setup Enviornment Variables
export ANSIBLE_CONFIG
export dream_data
export ANSIBLE_HOST_KEY_CHECKING


# Preform work on the system
mkdir -m 700 /etc/ansible
cp $dream_data/enviornment/ansible/hosts /etc/ansible/hosts

exit
