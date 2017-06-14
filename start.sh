#!/bin/bash

# default 
echo "Dovecot"
# echo "Host: $APP_HOST (should be set)"

# adding IP of a host to /etc/hosts
export HOST_IP=$(/sbin/ip route|awk '/default/ { print $3 }')
echo "$HOST_IP dockerhost" >> /etc/hosts

# defining mail name
echo "localhost" > /etc/mailname

mkdir /run/dovecot
chmod -R +r /run/dovecot
chmod -R +w /run/dovecot
chmod -R 777 /home/vmail
# start logger
rsyslogd 

# run Dovecot
dovecot -F
