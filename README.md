# Anchor_Linux Protection

Since on of August 2020 the virus, which attacks Linux systems To prevent an unwanted attack on for Linux machine, you can use [incrond](https://github.com/blt/incron)

Incron can trigger a script on activities in a filesystem. In case of trickbot ( anchor_linux ) uses logfile file in   **/tmp/Anchor.log**. 

So incrond watches the /tmp-folder and when an file Anchor.log is created or modified reaction are initiated.

- disks to read-only ( remount )
- stop network traffic ( aka panic mode )

The system in unusable  after an  calling  script  **/usr/local/bin/trickbot.sh** and only accessible by console.

But  this is probably the victims intention.


curl install | bash 

or

test with  vagrant  

#### Installation

    yum install incron
    systemctl enable  incrond
    systemctl start  incrond

#### Configuration

###### incron  

``` 
cat > /var/spool/incron/root << \EOF
/tmp IN_CREATE,IN_MODIFY /usr/local/bin/anchor_notify.sh $@ $# $%
EOF
```

###### notify script

/usr/local/bin/anchor_notify.sh

###### action script

/usr/local/bin/anchor_reaction.sh


https://www.bleepingcomputer.com/news/security/linux-warning-trickbot-malware-is-now-infecting-your-systems/

https://medium.com/stage-2-security/anchor-dns-malware-family-goes-cross-platform-d807ba13ca30
