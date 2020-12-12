@echo off
cd %~dp0
cd ..
SET JAVA_HOME=.\jdk\windows\jre
SET CLASSPATH=%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar
SET JAVAPATH=%JAVA_HOME%\bin

rem copy "%JAVAPATH%\java.exe" "%JAVAPATH%\FileSyncClientDaemon.exe"
copy "%JAVAPATH%\javaw.exe" "%JAVAPATH%\FileSyncClientDaemon.exe"


start %JAVAPATH%\FileSyncClientDaemon.exe -jar -Xms30m -Xmx1000m .\daemon\filesyncDaemon.jar  %1

exit
