#!/bin/bash

cd /etc/init.d && ./xively_monitoring stop
\rm -rfv /etc/init.d/xively_monitoring*
\rm -rfv /var/log/*.log.*

apt-get -y update
apt-get -y upgrade
apt-get -y install curl
# Ensure NFS mounts work properly
apt-get -y install nfs-common
apt-get clean

date > /etc/vagrant_box_build_time

apt-get install -y build-essential dkms rubygems lxc-docker
