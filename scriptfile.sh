#!/bin/sh
sudo mkdir /home/adzadmin/test/${BUILD_NUMBER}
sudo mv /home/adzadmin/test/gatewayserv*.zip /home/adzadmin/test/${BUILD_NUMBER}/
sudo cd /home/adzadmin/test/${BUILD_NUMBER}
sudo unzip gatewayserv-*.zip
