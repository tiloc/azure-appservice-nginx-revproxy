#!/bin/bash
cat >/etc/motd <<EOL 
========================================================
This system is owned and operated by a corporate entity.

Do not enter unless specifically authorized!
========================================================
EOL
cat /etc/motd

# Get environment variables to show up in SSH session
eval $(printenv | awk -F= '{print "export " $1"="$2 }' >> /etc/profile)

mkdir -p /run/sshd
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
