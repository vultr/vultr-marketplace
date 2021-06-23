#!/bin/bash
## Runs once-and-only-once at first boot per instance.

echo $(date -u) ": System provisioned." >> /var/log/per-instance.log

## Capture Marketplace Password Variables
DEMO_PASSWORD=$(curl -H "METADATA-TOKEN: vultr" http://169.254.169.254/v1/internal/app-demo_password)
WEB_PASSWORD=$(curl -H "METADATA-TOKEN: vultr" http://169.254.169.254/v1/internal/app-web_password)

## Create user
adduser demo --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password

## Set Password
echo demo:$DEMO_PASSWORD | chpasswd

## Report the Web Password
echo "The Web password is: $WEB_PASSWORD" > /root/web-password.txt
