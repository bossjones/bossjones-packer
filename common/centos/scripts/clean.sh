#!/bin/bash -x

# remove all the thing
rm -rfv /etc/chef
rm -rfv /var/chef

rm -fv /var/log/bootstrap.log
rm -fv /root/userdata
rm -fv /var/log/chef-client.log
rm -fv /var/log/cloud-init.log
rm -rfv /lib/udev/write_net_rules
rm -rfv /var/log/cron
rm -rfv /var/log/maillog
rm -rfv /var/log/messages-*
rm -rfv /var/log/maillog-*
rm -rfv /var/log/secure-*
rm -rfv /var/log/secure
rm -rfv /var/log/btmp-*
rm -rfv /var/log/cron-*
rm -rfv /var/log/httpd/*

#rm -rf /var/lib/cloud
#rm -rfv /var/log/spooler
#rm -rfv /var/log/boot.log
#rm -rfv /var/log/dmesg
#rm -rfv /var/log/dmesg.old
#rm -rfv /var/log/lastlog
rm -rfv /var/log/wtmp

yum remove chef -y
