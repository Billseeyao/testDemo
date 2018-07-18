#!/bin/bash

curdir="`pwd`"/"`dirname $0`"

## 每天6:00-22:00 每隔30分钟 执行一次
echo "0,30 06-22 * * * ${curdir}/neo4j_all_backup.sh" >> /var/spool/cron/root
service crond restart

