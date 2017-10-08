#!/bin/sh
user=$1
target_dir=$2
home=/home/$user
uid=$(stat -c %u $target_dir)
gid=$(stat -c %g $target_dir)

mkdir -p $home
chown $uid:$gid $home

if ! getent group $gid; then
	groupadd -g $gid embox_user
fi

useradd -u $uid -g $gid -G sudo -d $home -s /bin/bash $user
