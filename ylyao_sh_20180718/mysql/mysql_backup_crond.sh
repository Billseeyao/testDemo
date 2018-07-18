#!/bin/bash

## mysql 增量备份

curdir="`pwd`"/"`dirname $0`"

##定时任务 每日凌晨1点
echo "0 1 * * * ${curdir}/mysql_backup.sh" >> /var/spool/cron/root
service crond restart
