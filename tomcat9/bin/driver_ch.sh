#!/bin/sh

tomcatCnt=`ps -ef | grep AllLookHoneyLook | grep -v grep | grep -v vi | wc -l`
cnt=0
while [$cnt -lt 300]
do 
    cnt=$(($cnt+1))
    if [ $tocmatCnt -gt 0 ]
    then
        chmod 755 /var/lib/jenkins/workspace/AllLookHoneyLook/tomcat9/webapps/AllLookHoneyLook/resources/chromedriver/chromedriver
        break
    fi
done