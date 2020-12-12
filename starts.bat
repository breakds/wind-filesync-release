@echo off
cd /D %~dp0
rem rem 查找Filesync客户端程序是否启动
for /f "delims=" %%i in ('wmic Process Where "Name='FileSyncClient.exe'" Get ExecutablePath/Value') do ( 
echo %%i|find /i "%cd%\jdk\windows\jre\bin\FileSyncClient.exe">nul 2>nul&&exit||echo notexist
) 

SET JAVA_HOME=.\jdk\windows\jre
SET CLASSPATH=%JAVA_HOME%\lib\dt.jar
SET JAVAPATH=%JAVA_HOME%\bin

if exist "%cd%\lib\new.jar" (call %JAVAPATH%\FileSyncClient.exe -jar Wind.FileSync.ClientUpgrade.jar copy)
if exist "%cd%\lib\new.jar" (call %JAVAPATH%\FileSyncClient.exe -jar -Xms30m -Xmx1000m Wind.FileSync.Client.jar auto service)
if not exist "%cd%\lib\new.jar" (call %JAVAPATH%\FileSyncClient.exe -jar AutoUpdate.jar copy)
if not exist "%cd%\lib\new.jar" (call %JAVAPATH%\FileSyncClient.exe -jar -Xms30m -Xmx1000m fileSyncS.jar auto)
exit