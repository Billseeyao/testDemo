#!/bin/bash

## 监测的日志
file=/home/ylyao/test/error.log
## curl请求的ip
hostIP='192.168.163.1'

## Create a temporary file to count log file offset 
countFile=/tmp/log/conf_log_count.txt
if [ ! -f "${countFile}" ];then
	mkdir /tmp/log
	touch "${countFile}"
	chmod 755 /tmp/log
	chmod 755 "${countFile}"
	echo "1" > "${countFile}"
fi

## Get countNo
countNo=$(echo $(cat "${countFile}"))

## Read line content from log offset
cat "${file}" | tail -n +$(echo $(cat "${countFile}")) | while read line
do
	countNo=`expr ${countNo} + 1`;
#	echo "${countNo}";
	echo "${countNo}" > ${countFile};

	result=$(echo "${line}" | grep "ERROR")
	if [ -n "${result}" ];then
		echo "${line}"
		str=$(echo "${line}" | sed 'N;s/\n//g')   ## replace special character
#		curl -X POST '192.168.163.1:80/addErrorLog1' -H 'content-Type:application/json' -d '{"id":"1","message":"'"${str}"'","errorType":"ERROR","url":"'"${hostIP}"'","port":"80"}'
		curl -X POST '192.168.163.1:80/addErrorLog1' -H 'content-Type:application/json' -d '{"message":"'"${str}"'","errorType":"ERROR"}'

	fi

done




