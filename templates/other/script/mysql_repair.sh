#!/bin/bash 
#author:itnihao 
#mail:itnihao@qq.com 
#date 2013-02-18 
#version v1.0 
#function:repair mysql table 
 
    User=root 
    Password=mysql_pass
    Host=localhost
    Database=$(mysql -u${User} -p${Password} -h${Host}  -e 'show databases'|grep -v  'Database') 
for DBname in ${Database}  
do 
       table=$(mysql -u${User} -p${Password} -h${Host} ${DBname} -e 'show tables'|grep -v tables_in_mysql) 
      for tableName in ${table} 
            do
                 mysql -u${User} -p${Password} -h${Host} ${DBname} -e "check table ${tableName}" 
                [ "$?" != 0 ] && mysql -u${User} -p${Password} -h${Host} ${DBname} -e "repair table ${tableName}" 
      done 
done 
