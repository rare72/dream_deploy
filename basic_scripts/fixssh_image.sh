#!/bin/bash

sudo wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O .ssh/authorized_keys &
sudo chmod 700 .ssh &&
sudo chmod 600 .ssh/authorized_keys ;
sudo chown -R vagrant:vagrant .ssh

exit
