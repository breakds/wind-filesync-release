#!/bin/bash
echo `dirname $0` is in `pwd`
export DISPLAY=:0.0

cd `dirname $0`
echo `dirname $0`
cd ..

echo $(pwd)

processname=$(pwd)
echo $processname

cp $processname/jdk/linux/jre/bin/java $processname/jdk/linux/jre/bin/ClientDaemon
$processname/jdk/linux/jre/bin/ClientDaemon -jar -Xms30m -Xmx300m ./daemon/filesyncDaemon.jar $1 &
