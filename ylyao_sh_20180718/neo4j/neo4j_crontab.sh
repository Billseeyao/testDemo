#!/bin/bash

curdir="`pwd`"/"`dirname $0`"

## ÿ��6:00-22:00 ÿ��30���� ִ��һ��
echo "0,30 06-22 * * * ${curdir}/neo4j_all_backup.sh" >> /var/spool/cron/root
service crond restart

