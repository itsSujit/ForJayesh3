#!/bin/sh
mkdir /home/adzadmin/test/${BUILD_ID}
mv /home/adzadmin/test/gatewayserv*.zip /home/adzadmin/test/${BUILD_ID}/
cd /home/adzadmin/test/${BUILD_ID}
unzip gatewayserv-*.zip
if [ $HOSTNAME = ${dev_env} ] 
then 
    mv /home/adzadmin/test/${BUILD_ID}/dev-application.properties /home/adzadmin/test/${BUILD_ID}/application.properties
elif [ $HOSTNAME == ${test_env} ] 
then 
    mv /home/adzadmin/test/${BUILD_ID}/test-application.properties /home/adzadmin/test/${BUILD_ID}/application.properties
else
    echo "You are on wrong server"
fi
