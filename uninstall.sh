#!/bin/bash


# rm incrontab for root
[ -e /var/spool/incron/root ]  && rm /var/spool/incron/root

# rm anchor_notify.sh
[ -e  /usr/local/bin/anchor_notify.sh ] && rm /usr/local/bin/anchor_notify.sh
# rm anchor_reaction.sh
[ -e  /usr/local/bin/anchor_reaction.sh ] && rm /usr/local/bin/anchor_reaction.sh


if test -e  /etc/debian_version ; then
    systemctl disable incron
    systemctl stop incron
elif test -e  /etc/redhat-release ; then
    systemctl disable incrond
    systemctl stop incrond
fi



