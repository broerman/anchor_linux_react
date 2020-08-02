#### Installation

yum -y -d1  install incron

systemctl enable  incrond 

#### Konfiguration

###### incron 

echo "Write /var/spool/incron/root"
cat > /var/spool/incron/root << \EOF
/tmp IN_CREATE,IN_MODIFY /usr/local/bin/anchor_notify.sh $@ $# $%
EOF

# cp /vagrant/provision/anchor_notify.sh /usr/local/bin/anchor_notify.sh
# cp /vagrant/provision/anchor_reaction.sh /usr/local/bin/anchor_reaction.sh

