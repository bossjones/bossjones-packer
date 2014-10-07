#!/bin/bash

cd /etc/init.d;
sudo service xively_monitoring stop;
sudo \rm -rfv /etc/init.d/xively_monitoring*
sudo \rm -rfv /etc/init.d/xively_monitoring*
sudo \rm -rfv /var/log/*.log.*

sudo apt-get -y update
#sudo apt-get -y upgrade
sudo apt-get -y install curl
#sudo # Ensure NFS mounts work properly
sudo apt-get -y install nfs-common
sudo apt-get clean

date > /etc/vagrant_box_build_time

sudo apt-get install -y build-essential dkms rubygems

#lxc-docker
