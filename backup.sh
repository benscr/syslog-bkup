#!/bin/bash
NOW=$(date +"%Y-%m-%d")

#Move Files to Archive and restart Syslog
mv /var/log/udp514*.log /mnt/hd2/syslog-archive/

service syslog-ng restart

#Compress Log
if [ -f "$FILE" ]; then
        tar -czvf /mnt/hd2/syslog-archive/paloalto-$NOW.2.tar.gz /mnt/hd2/syslog-archive/udp514*.log
else
        tar -czvf /mnt/hd2/syslog-archive/paloalto-$NOW.tar.gz /mnt/hd2/syslog-archive/udp514*.log
fi

rm /mnt/hd2/syslog-archive/udp514*.log
