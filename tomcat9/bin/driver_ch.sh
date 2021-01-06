tomcatCnt=`ps -ef | grep AllLookHoneyLook | grep -v grep | grep -v vi | wc -l`

while [ $tomcatCnt -gt 0] ;
do 
    if [ $tocmatCnt -gt 0 ]; then
        chmod 755 /var/lib/jenkins/workspace/AllLookHoneyLook/tomcat9/webapps/AllLookHoneyLook/resources/chromedriver/chromedriver
        break
done