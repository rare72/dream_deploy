Install Python 3
apt-get install python3

Change defaault python to version 3
alias python='/usr/bin/python3.4'

Add the line to the .bashrc file 
alias python='/usr/bin/python3.4'

Modify system-wide alternatives
update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
update-alternatives --install /usr/bin/python python /usr/bin/python3.4 2

Make installer folder
mkdir -p -m 777 /data/installer

Download Anaconda
wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-4.0.0-Linux-x86_64.sh -P /data/installer/

Install Anaconda
bash Anaconda3-4.0.0-Linux-x86_64.sh

Set PATH in .bashrc for Anaconda
export PATH="/data/anaconda3/bin:$PATH"

Setup Sudo
