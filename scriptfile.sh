#!/bin/sh
mkdir /home/adzadmin/test/$(date +%Y%m%d)
mv /home/adzadmin/test/gatewayserv*.zip /home/adzadmin/test/$(date +%Y%m%d)/
cd /home/adzadmin/test/$(date +%Y%m%d)
unzip gatewayserv-*.zip
