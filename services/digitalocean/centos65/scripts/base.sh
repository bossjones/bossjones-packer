#!/bin/bash

# use this to setup an unbaked AWS AMI
# epel repo
cat > /etc/yum.repos.d/epel.repo << EOM
[epel]
name=epel
baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
enabled=0
gpgcheck=0
EOM

# update Centos-Base
sed -i "s,^#baseurl=http://mirror.centos.org/centos/\$releasever,baseurl=http://berepo2.be.net/centos/6.5,g" /etc/yum.repos.d/CentOS-Base.repo
sed -i "s,^mirrorlist,#mirrorlist,g" /etc/yum.repos.d/CentOS-Base.repo

cat > /etc/yum.repos.d/be-imagemagick.repo << EOM
[be-imagemagick]
name=be-imagemagick
baseurl=http://berepo2.be.net/be-imagemagick/centos/6/\$basearch
enabled=0
gpgcheck=0
EOM

cat > /etc/yum.repos.d/be-epel.repo << EOM
[be-epel]
name=be-epel
baseurl=http://berepo2.be.net/be-epel/centos/6/\$basearch
enabled=0
gpgcheck=0
EOM

cat > /etc/yum.repos.d/be-chef.repo << EOM
[be-chef]
name=be-chef
baseurl=http://berepo2.be.net/be-chef/centos/6/\$basearch
enabled=0
gpgcheck=0
EOM

cat > /etc/yum.repos.d/be-java.repo << EOM
[be-java]
name=be-java
baseurl=http://berepo2.be.net/be-java/centos/6/\$basearch
enabled=0
gpgcheck=0
EOM

# setup python
yum install python-pip --enablerepo=be-epel -y
