#!/bin/sh

echo $$
/usr/local/sbin/create_matching_user.sh user /embox

mkdir -p /var/run/sshd
exec /usr/sbin/sshd -D

