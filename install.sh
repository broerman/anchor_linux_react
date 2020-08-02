#!/bin/bash


# Install incon
curl -Ss -L https://raw.githubusercontent.com/broerman/anchor_linux_react/master/provision/packages.sh | /bin/bash

# get anchor_notify.sh
curl -Ss -L https://raw.githubusercontent.com/broerman/anchor_linux_react/master/provision/anchor_notify.sh -o /usr/local/bin/anchor_notify.sh
# get anchor_reaction.sh
curl -Ss -L https://raw.githubusercontent.com/broerman/anchor_linux_react/master/provision/anchor_reaction.sh -o /usr/local/bin/anchor_reaction.sh
# get incrontab for root
curl -Ss -L https://raw.githubusercontent.com/broerman/anchor_linux_react/master/provision/incron_root  -o /var/spool/incron/root







