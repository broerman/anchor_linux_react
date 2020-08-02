sudo cp /home/vagrant/anchor_notify.sh /usr/local/bin/anchor_notify.sh
chmod 755 /usr/local/bin/anchor_notify.sh
sudo cp /home/vagrant/anchor_reaction.sh /usr/local/bin/anchor_reaction.sh
chmod 755 /usr/local/bin/anchor_reaction.sh

sudo cp /home/vagrant/incron_root /var/spool/incron/root

systemctl restart  incrond

