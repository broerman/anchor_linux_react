#!/bin/bash

path="$1"
file="$2"
action="$3"
DATUM=$(LANG=C date)
case "$action" in
    'IN_MODIFY'|'IN_CREATE')
        if [ $file == "anchor.log" ] ; then 
            /usr/local/bin/anchor_reaction.sh
        fi
    ;;
esac
exit 0
