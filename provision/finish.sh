if test -e  /etc/debian_version ; then
    systemctl restart  incron
elif test -e  /etc/redhat-release ; then
    systemctl restart  incrond
fi



