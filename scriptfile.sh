#!/bin/sh
mkdir /home/adzadmin/test/${BUILD_NUMBER}
mv /home/adzadmin/test/gatewayserv*.zip /home/adzadmin/test/${BUILD_NUMBER}/
cd /home/adzadmin/test/${BUILD_NUMBER}
unzip gatewayserv-*.zip
echo "serevr hostname is $dev_env"
