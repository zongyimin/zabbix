zabbix
======

zabbix monitor with shell

egrep -v "(#|^$)" zabbix_server.conf 
```
LogFile=/var/log/zabbix/zabbix_server.log
DBHost=localhost
DBName=zabbix
DBUser=zabbix
DBPassword=zabbix
DBSocket=/var/lib/mysql/mysql.sock 
DBPort=3306
StartPollers=160
StartTrappers=20
StartPingers=100
StartDiscoverers=120
MaxHousekeeperDelete=5000
CacheSize=1024M
StartDBSyncers=16
HistoryCacheSize=1024M
TrendCacheSize=1024M
HistoryTextCacheSize=512M
AlertScriptsPath=/etc/zabbix/alertscripts
LogSlowQueries=1000
```

egrep -v "(#|^$)" zabbix_agentd.conf
```
LogFile=/var/log/zabbix/zabbix_agentd.log
EnableRemoteCommands=0
Server=127.0.0.1,10.10.10.10
StartAgents=8
ServerActive=10.10.10.10:10051
Hostname=nat.kx1d.com
Timeout=30
Include=/etc/zabbix/zabbix_agentd.conf.d/
UnsafeUserParameters=1
```

egrep -v "(#|^$)" /etc/my.cnf
```
[client]
port            = 3306
socket          = /var/lib/mysql/mysql.sock
[mysqld]
port            = 3306
socket          = /var/lib/mysql/mysql.sock
skip-external-locking
character-set-server = utf8
slow_query_log
slow_query_log_file = /var/log/mysql/slowquery.log
long_query_time = 2
log-error = /var/log/mysql/log-error.log
skip-name-resolve
max_connections = 5000
back_log = 300
table-cache=4096
max_allowed_packet  = 32M
max-heap-table-size = 128M
key_buffer_size     = 128M
sort-buffer-size    = 16M
join-buffer-size    = 16M
net_buffer_length   = 8K
read_buffer_size    = 256K
read_rnd_buffer_size = 512K
myisam_sort_buffer_size = 8M
thread-cache-size   = 16
thread-concurrency  = 24
query-cache-size    = 4096M
query-cache-limit   = 4M
tmp-table-size      = 128M
log_warnings
innodb_file_per_table=1
innodb_file_io_threads=4
innodb_open_files=2048
innodb_buffer_pool_size = 10G
innodb_additional_mem_pool=16M
innodb_thread_concurrency = 16
innodb_max_dirty_pages_pct = 90
log-bin=mysql-bin
binlog_format=mixed
server-id       = 1
[mysqldump]
quick
max_allowed_packet = 16M
[mysql]
no-auto-rehash
[myisamchk]
key_buffer_size = 20M
sort_buffer_size = 20M
read_buffer = 2M
write_buffer = 2M
[mysqlhotcopy]
interactive-timeout
```
