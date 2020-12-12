#!/bin/bash
export DISPLAY=:0.0

RecentDir=`pwd`
echo $RecentDir

pname=$RecentDir/jdk/linux/jre/bin/FileSyncClient
result=`ps aux | grep $pname | grep -v grep`    
if [ $? -eq 0 ]
then        
 echo "process exists!"
else       
 echo "process not exists!"
fi

if [ ! -d $RecentDir/jdk/linux/jre/lib/amd64/server/ ]
then
 echo "i386"
 export LD_LIBRARY_PATH=$RecentDir/jdk/linux/jre/lib/i386/server/
else
 echo "x64"
 export LD_LIBRARY_PATH=$RecentDir/jdk/linux/jre/lib/amd64/server/
fi

JAVA_VERSION=`$RecentDir/jdk/linux/jre/bin/FileSyncClient -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
echo "java_vserion:"$JAVA_VERSION

if [ ! -f  $RecentDir/lib/new.jar ]
then        
 $RecentDir/jdk/linux/jre/bin/FileSyncClient -jar AutoUpdate.jar copy
else       
 $RecentDir/jdk/linux/jre/bin/FileSyncClient -jar Wind.FileSync.ClientUpgrade.jar copy
fi
if [ ! -f  $RecentDir/lib/new.jar]
then        
 nohup $RecentDir/jdk/linux/jre/bin/FileSyncClient -jar -Xms30m -Xmx300m fileSync.jar $1 >/dev/null 2>&1 & 
else       
 nohup $RecentDir/jdk/linux/jre/bin/FileSyncClient -jar -Xms30m -Xmx300m Wind.FileSync.Client.jar $1 >/dev/null 2>&1 & 
fi