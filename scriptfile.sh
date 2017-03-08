#!/bin/sh
mkdir /home/adzadmin/test/${BUILD_NUMBER}
mv /home/adzadmin/test/gatewayserv*.zip /home/adzadmin/test/${BUILD_NUMBER}/
cd /home/adzadmin/test/${BUILD_NUMBER}
unzip gatewayserv-*.zip
if [ $HOSTNAME = ${dev_env} ] 
then 
    mv /home/adzadmin/test/${BUILD_NUMBER}/dev-application.properties /home/adzadmin/test/${BUILD_NUMBER}/application.properties
elif [ $HOSTNAME == ${test_env} ] 
then 
    mv /home/adzadmin/test/${BUILD_NUMBER}/test-application.properties /home/adzadmin/test/${BUILD_NUMBER}/application.properties
else
    echo "You are on wrong server"
fi
