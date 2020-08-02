#!/bin/bash

# Notify
# echo "Anchor.log modifyed" >> /root/A
# poweroff -f


# iptables
### disable network traffic
iptables --flush
iptables -P OUTPUT DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP


###  set disks readonly
mount |sed -n  "s/.* on \(.*\) type \(ext[a-z0-9]*\|xfs\|btrfs\|zfs\) .*/mount -o remount,ro \1 # \2/p" | sh

