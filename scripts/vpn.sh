#!/bin/bash

STATUS=$1

if [ -z $STATUS ]; then
    echo "The second argument shouldn't be null."
    exit 1
elif [ $STATUS == "on" ]; then
    mkdir -p /var/run/xl2tpd
    touch /var/run/xl2tpd/l2tp-control
    systemctl restart strongswan
    systemctl restart xl2tpd
    echo "Connecting $VPN_NAME: $VPN_IP..."
    ipsec up $VPN_NAME
    echo "c $VPN_NAME" > /var/run/xl2tpd/l2tp-control
    IP=$(ip route | grep "default via" | awk '{print $3}')
    route add $VPN_IP gw $IP
    route add default dev ppp0
elif [ $STATUS == "off" ]; then
    route del default dev ppp0
    echo "d $VPN_NAME" > /var/run/xl2tpd/l2tp-control
    ipsec down $VPN_NAME
    rm /var/run/xl2tpd/l2tp-control
else
    echo "The second variable should be 'on' or 'off'."
fi
