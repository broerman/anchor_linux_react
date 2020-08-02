#### Installation


if test -e  /etc/debian_version ; then
    apt-get update ; apt-get install incron
    echo "root" > /etc/incron.allow
elif test -e  /etc/redhat-release ; then 
    yum -y  install incron
    systemctl enable  incrond 
fi

#### Konfiguration

echo "Write /var/spool/incron/root"
cat > /var/spool/incron/root << \EOF
/tmp IN_CREATE,IN_MODIFY /usr/local/bin/anchor_notify.sh $@ $# $%
EOF


