# Anchor_Linux Protection

Since on of August 2020 the virus, which attacks Linux systems to prevent an unwanted attack on for Linux machine, you can use [incrond](https://github.com/ar~/incron). 

Incron can trigger a script on activities in a filesystem. In case of trickbot ( anchor_linux ) uses logfile file in   **/tmp/anchor.log**. 

So incrond watches the /tmp-folder and when an file anchor.log is created or modified reaction are initiated.

- disks to read-only ( remount )
- stop network traffic ( aka panic mode ) , except SSH
- default route is deleted

The system in partial unusable  after calling  script  **/usr/local/bin/anchor_reaction.sh** and only accessible by console.

But  this is probably the victims intention.

#### Installation for impatient 

    curl https://raw.githubusercontent.com/broerman/anchor_linux_react/master/install.sh | bash 

#### Test in Vagrant

Some vagarant images are tested.

I noticed the incon package is not maintained for a long time.  



| os         |                        |
| ---------- | ---------------------- |
| centos7    | ok                     |
| centos8    | ok                     |
| ubuntu1804 | ok                     |
| debian9    | ok                     |
| debian10   | incrond is not working |
| ubuntu2004 | incrond is not working |

  

### Installation step-by-step

#### Packages

The package **incrond**  or **incon** has to be installed.

#### Configuration

###### incron notify configuration  

    cat /var/spool/incron/root
    /tmp IN_CREATE,IN_MODIFY /usr/local/bin/anchor_notify.sh $@ $# $%

###### notify script

the notify script is called every time when file are created or modified in /tmp.  

    /usr/local/bin/anchor_notify.sh

If filename matches anchor_linux log, then it calls anchor_reaction.sh.

###### action script

in the reaction script are all system programs which prevents spreading the virus. 



    /usr/local/bin/anchor_reaction.sh



Look at 

https://www.bleepingcomputer.com/news/security/linux-warning-trickbot-malware-is-now-infecting-your-systems/

https://medium.com/stage-2-security/anchor-dns-malware-family-goes-cross-platform-d807ba13ca30
