#!/bin/sh
#
# A helper script for ENTRYPOINT.
set -e

IFS=$'\n'
for backup in $BACKUP_DIRECTORIES; do
        echo "backup	$backup" >> /etc/rsnapshot.conf
done

#exec "$@"
`rsnapshot hourly`
#/bin/sh /run-rsnapshot.sh

if [ ! -z $PUSH_BACKUP ]
then
	`rsync -ar -e 'ssh -i /root/.ssh/id_rsa' /var/rsnapshot/ $PUSH_BACKUP`
fi
