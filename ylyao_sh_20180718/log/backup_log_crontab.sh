#!/bin/bash

curdir="`pwd`"/"`dirname $0`"

echo "* */1 * * * ${curdir}/backup_log.sh" >> /var/spool/cron/root
service crond restart
