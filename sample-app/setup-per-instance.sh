#!/bin/bash
## Runs once-and-only-once at first boot per instance.

## Report the start time to a logfile.
echo $(date -u) ": System provisioning started." >> /var/log/per-instance.log

## Capture the Marketplace Password Variables.
DB_PASS=$(curl -H "METADATA-TOKEN: vultr" http://169.254.169.254/v1/internal/app-db_pass)
WEB_PASS=$(curl -H "METADATA-TOKEN: vultr" http://169.254.169.254/v1/internal/app-web_pass)

## Create an example database.
mysql -u root -e "CREATE DATABASE example_db;";

## Create an example user and set the password to Marketplace Password Variable $DB_PASS.
mysql -u root -e "GRANT ALL ON example_db.* TO 'example_user'@'localhost' IDENTIFIED BY '$DB_PASS' WITH GRANT OPTION;";

## Create a username/password for Nginx with the Marketplace Password Variable $WEB_PASS.
htpasswd -cb /etc/nginx/.htpasswd example_user $WEB_PASS

## Report the Web Password
echo "The Web password is: $WEB_PASS" > /root/web-password.txt

## Report the DB Password
echo "The DB password is: $DB_PASS" > /root/db-password.txt

## Report the end time to a logfile.
echo $(date -u) ": System provisioning script is complete." >> /var/log/per-instance.log
