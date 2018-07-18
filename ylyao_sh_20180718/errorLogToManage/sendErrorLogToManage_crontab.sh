#!/bin/bash

curdir="`pwd`"/"`dirname $0`"

echo "* */1 * * * ${curdir}/sendErrorLogToManage.sh" >> /var/spool/cron/root
service crond restart
