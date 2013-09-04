zabbix
======

zabbix monitor with shell

```
egrep -v "(#|^$)" zabbix_server.conf 
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
