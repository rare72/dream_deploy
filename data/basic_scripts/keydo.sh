ssh-add 
  version 2 RSA public key
ssh-keyscan
ssh-copy-id

curl -Lo /home/vagrant/.ssh/authorized_keys \
  'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
