#!/bin/bash

# This will set ypu local cache server if you are ussing one
# echo 'Acquire::http { proxy "http://raspi-cache:3142"; };' > /etc/apt/apt.conf.d/02proxy

apt-get update
apt-get --assume-yes upgrade

curl -SL https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-armv7.tar.gz > node_exporter.tar.gz && \
tar -xvf node_exporter.tar.gz -C /usr/local/bin/ --strip-components=1

#mkdir -p /var/lib/node_exporter/textfile
#chmod 777 /var/lib/node_exporter/textfile 

cp nodeexporter.service /etc/systemd/system

systemctl daemon-reload 
systemctl enable nodeexporter 
systemctl start nodeexporter

# Install Docker

curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
usermod -aG docker pi

# Install Salt 
#wget -O - https://repo.saltstack.com/apt/debian/9/armhf/latest/SALTSTACK-GPG-KEY.pub | apt-key add -

#echo 'deb http://repo.saltstack.com/apt/debian/9/armhf/2018.3/ stretch main' >> /etc/apt/sources.list.d/saltstack.list

#apt-get update
#apt-get --assume-yes upgrade

#apt-get install salt-minion --assume-yes
