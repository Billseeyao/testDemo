#!/bin/bash

## 需要备份的日志文件 [可更改]
mylog='/home/ylyao/test/error.log'

## 备份文件目标目录
mypath='/tmp/log/aa'


# 获得当前文件路径
#curdir="`pwd`"/"`dirname $0`"

if [ ! -d "${mypath}" ];then
	mkdir "${mypath}"
	chmod 755 "${mypath}"
fi

time=`date +%Y%m%d%H%M%S`
cp "${mylog}" "${mypath}"/"${time}"_error.log
echo "${mylog}" "${mypath}"/"${time}"_error.log

