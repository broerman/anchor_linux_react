#!/bin/bash

# This script imstalls Incrond package an starts it.
# incrontab for root is created
# anchor_reaction.sh and anchor_notify.sh are installed under /usr/local/bin
#


# Install incond service
curl -Ss -L https://raw.githubusercontent.com/broerman/anchor_linux_react/master/provision/packages.sh | /bin/bash

# get anchor_notify.sh
curl -Ss -L https://raw.githubusercontent.com/broerman/anchor_linux_react/master/provision/anchor_notify.sh -o /usr/local/bin/anchor_notify.sh
chmod 755 /usr/local/bin/anchor_notify.sh
# get anchor_reaction.sh
curl -Ss -L https://raw.githubusercontent.com/broerman/anchor_linux_react/master/provision/anchor_reaction.sh -o /usr/local/bin/anchor_reaction.sh
chmod 755 /usr/local/bin/anchor_reaction.sh
# get incrontab for root
curl -Ss -L https://raw.githubusercontent.com/broerman/anchor_linux_react/master/provision/incron_root  -o /var/spool/incron/root


curl -Ss -L https://raw.githubusercontent.com/broerman/anchor_linux_react/master/provision/finish.sh | /bin/bash







