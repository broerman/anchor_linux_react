#!/bin/bash

# Things to do, which avoids spreading of virus

IPROUTE=false;NETTOOLS=false
if   type -p ip   2>/dev/null ; then IPROUTE=true
elif type -p route 2>/dev/null; then NETTOOLS=true
fi

$IPROUTE  && IFACE_PRIMARY=$(ip route | sed -n "s/default via \(.*\) dev \([a-z0-9]*\) .*/\2/p")
$NETTOOLS && IFACE_PRIMARY=$(route -n | sed -n "s/^0.0.0.0 .* \([a-z0-9]*\)$/\1/p")


# iptables
### disable network traffic
iptables --flush
iptables -P OUTPUT DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
if [ $IFACE_PRIMARY ] ; then 
    iptables -A INPUT -i $IFACE_PRIMARY  -p tcp  --dport ssh -j ACCEPT
    iptables -A OUTPUT -o $IFACE_PRIMARY  -p tcp  --sport ssh -j ACCEPT
fi

### delete default route
$IPROUTE  && route del default
$NETTOOLS && ip route del default



###  try to set disks readonly
mount |sed -n  "s/.* on \(.*\) type \(ext[a-z0-9]*\|xfs\|btrfs\|zfs\) .*/mount -o remount,ro \1 # \2/p" | sh

if   type -p logger   2>/dev/null ; then
    logger  -p auth.emerg -t inotify "Your system was probably infecteted by ancher_linux, because /tmp/anchor.log was found. until reboot firewall drops all packages except SSH, default route ist deleted."
fi
