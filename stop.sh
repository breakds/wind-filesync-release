#!/bin/bash                                      
#echo `dirname $0`                               
cd `dirname $0`                                  
RecentDir=`pwd`                                  
pname=$RecentDir/jdk/linux/jre/bin/FileSyncClient
#echo $pname                                     
result=`ps aux | grep $pname | grep -v grep`     
if [ $? -eq 0 ]                                  
then                                             
# echo $result                                   
 array=(${result// / })                          
# for var in ${array[@]}                         
# do                                             
#    echo $var                                   
# done                                           
# echo ${array[1]}                               
 kill -9 ${array[1]}                             
fi
                                               
pname=$RecentDir/jdk/linux/jre/bin/ClientDaemon  
result=`ps aux | grep $pname | grep -v grep`     
if [ $? -eq 0 ]                                  
then                                             
 array=(${result// / })                          
 kill -9 ${array[1]}                             
fi