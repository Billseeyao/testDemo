#!/bin/bash

## 说明：第一次备份是全量备份，之后执行是增量形式
./scai/neo4j/neo4j-community-3.4.1/bin/neo4j-backup -host 192.168.1.214 -to /scai/neo4j_backup
