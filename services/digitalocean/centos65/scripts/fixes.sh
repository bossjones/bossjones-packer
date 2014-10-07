#!/bin/bash

sudo yum install mailx wget finger lsof -y

#sudo echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

# append this to /root/
# echo 'ALERT - Root Shell Access (ServerName) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" joneseymalcolm@gmail.com


# sudo yum install denyhosts
# sudo yum install denyhosts --enablerepo=be-epel
# sudo wget http://mirror.metrocast.net/fedora/epel/6/x86_64/denyhosts-2.6-19.el6.noarch.rpm
# sudo rpm -Uvh http://mirror.metrocast.net/fedora/epel/6/x86_64/denyhosts-2.6-19.el6.noarch.rpm
# sudo yum search libselinux-python
# sudo yum install
# sudo yum install libselinux-python
# sudo yum install denyhosts-2.6-19.el6.noarch.rpm

#sudo yum upgrade -y
sudo yum downgrade openssl-1.0.1e-16.el6_5.14.x86_64 openssl-devel-1.0.1e-16.el6_5.14.x86_64 -y
