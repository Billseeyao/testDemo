
###################  添加对应定时任务  #################

1) mysql数据库定时增量备份,执行
	./mysql/mysql_backup_crond.sh
	
2) 日志定时备份 ,执行
	./log/backup_log_crontab.sh

3) curl 发送异常日志, 添加定时器,执行
	./errorLogToManage/sendErrorLogToManage_crontab.sh
	
4) neo4j 定时增量备份
	./neo4j/neo4j_crontab.sh


