#!/bin/bash
#
# A helper script for ENTRYPOINT.

set -e

#ssh-keygen -t rsa -N "" -f /var/keys-rsnap/my.key





syslogger_tag=""

if [ -n "${SYSLOGGER_TAG}" ]; then
  syslogger_tag=" -t "${SYSLOGGER_TAG}
fi

syslogger_command=""

if [ -n "${SYSLOGGER}" ]; then
  syslogger_command="logger "${syslogger_tag}
fi

source /usr/bin/rsnapshot.d/rsnapshot.sh

if [ "$1" = 'rsnapshot' ]; then
  exec rsnapshot $backup_interval
fi

exec "$@"
