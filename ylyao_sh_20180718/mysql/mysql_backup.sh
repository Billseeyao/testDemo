#!/bin/bash
#### 前提mysql my.cnf开启log-bin=mysql-bin

## 可更改变量 [需更改]
mysql_ip=192.168.235.142
user=root
pw=root 
## 增量备份目标目录，提前创建 [需更改]
BakDir=/scai/mysql_backup    
## mysql安装目录 ,可更改 [需更改]
mysql_install=/usr/local/mysql 




## mysql-bin.0000XX 所在路径 (即mysql安装路径/data目录下)
BinDir=${mysql_install}/data
## 增量备份产生的日志信息
LogFile=${BakDir}/bak.log

BinFile=${BinDir}/mysql-bin.index
${mysql_install}/bin/mysqladmin -h${mysql_ip} -u${user} -p${pw} flush-logs

#这个是用于产生新的mysql-bin.00000*文件
Counter=`wc -l $BinFile |awk '{print $1}'`
NextNum=0
#这个for循环用于比对$Counter,$NextNum这两个值来确定文件是不是存在或最新的
for file in `cat $BinFile`
do
    base=`basename $file`
    #basename用于截取mysql-bin.00000*文件名，去掉./mysql-bin.000005前面的./
    NextNum=`expr $NextNum + 1`
    if [ $NextNum -eq $Counter ]
    then
        echo $base skip! >> $LogFile
    else
        dest=$BakDir/$base
        if(test -e $dest)
        #test -e用于检测目标文件是否存在，存在就写exist!到$LogFile去
        then
            echo $base exist! >> $LogFile
        else
            cp $BinDir/$base $BakDir
            echo $base copying >> $LogFile
         fi
     fi
done
echo `date +"%Y年%m月%d日 %H:%M:%S"` Bakup succ! >> $LogFile
