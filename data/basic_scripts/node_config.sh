#!/binbash

#Setup sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant

# Set up the basic enviornment.
mkdir -p -m 777 /data/install
mkdir -p -m 777 /data/enviornment/vagrant
mkdir -p -m 777 /data/tmp
mkdir -p -m 777 /data/data_app

mkdir -p -m 777 /data/api
mkdir -p -m 777 /data/basic_scripts
mkdir -p -m 777 /data/scriptlet
mkdir -p -m 777 /data/PROJECTS
mkdir -p -m 777 /data/logs

# Create a standard enviornment file
{ date -u ; uname -n ;} > /data/logs/vagrant_box_build_time
{ date -u ; uname -n ;} > /data/logs/DUMB_NODE


# Create the user vagrant with password vagrant
useradd -G sudo -p $(perl -e 'print crypt("vagrant", "vagrant")') -m -s /bin/bash -N vagrant

# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /var/run/motd


### SSH Key-Management
# Find & Copy the old ssh keys to the Controller
sudo find / -not \( -path /etc/ssh -prune \) -name \*.pub >> /data/tmp/`uname -n`.`date "+%Y%m%d"`.txt

xargs -a "/data/tmp/`uname -n`.`date "+%Y%m%d"`.txt" | xargs -i scp {} vagrant@ansible_controller:/data/data_app/keys/bad_archive;


# Create new ssh key
ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -q -P ""

# Copy the new ssh key to the Controller


# Revoke the old ssh keys
ssh-keygen -k -f /path/to/revoked-keys -u -s /path/to/public-key-or-file

# Prune the old ssh keys

# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys \
  'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

exit
