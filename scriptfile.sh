#!/bin/sh
mkdir /home/adzadmin/test/${BUILD_NUMBER}
mv /home/adzadmin/test/gatewayserv*.zip /home/adzadmin/test/${BUILD_NUMBER}/
cd /home/adzadmin/test/${BUILD_NUMBER}
unzip gatewayserv-*.zip
if [ $HOSTNAME == "ip-172-30-2-88.ec2.internal" ] 
then 
    mv /home/adzadmin/test/${BUILD_NUMBER}/dev-application.properties /home/adzadmin/test/${BUILD_NUMBER}/application.properties
elif [ $HOSTNAME == "ip-172-30-2-206.ec2.internal" ] 
then 
    mv /home/adzadmin/test/${BUILD_NUMBER}/test-application.properties /home/adzadmin/test/${BUILD_NUMBER}/application.properties
elif [ $HOSTNAME== "ip-172-30-2-82.ec2.internal" ]
then 
    mv /home/adzadmin/test/${BUILD_NUMBER}/demo-application.properties /home/adzadmin/test/${BUILD_NUMBER}/application.properties
else
    echo "You are on wrong server"
fi
