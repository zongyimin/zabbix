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
