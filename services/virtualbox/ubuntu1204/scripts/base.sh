#!/bin/bash

cd /etc/init.d && ./xively_monitoring stop
\rm -rfv /etc/init.d/xively_monitoring*
\rm -rfv /var/log/*.log.*
