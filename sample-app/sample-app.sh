#!/bin/bash
################################################
## Prerequisites
chmod +x /root/vultr-helper.sh
. /root/vultr-helper.sh
error_detect_on
install_cloud_init latest

################################################
## Create script folders for cloud-init
mkdir -p /var/lib/cloud/scripts/per-boot/
mkdir -p /var/lib/cloud/scripts/per-instance/

################################################
## Make a per-boot script.
cat << "EOFBOOT" > /var/lib/cloud/scripts/per-boot/setup.sh
#!/bin/bash
## Run on every boot.
echo $(date -u) ": System booted." >> /var/log/per-boot.log
EOFBOOT

################################################
## Make a per-instance script.
cat << "EOFINSTANCE" > /var/lib/cloud/scripts/per-instance/provision.sh
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
EOFINSTANCE

################################################
# Make the scripts executable
chmod +x /var/lib/cloud/scripts/per-boot/setup.sh
chmod +x /var/lib/cloud/scripts/per-instance/provision.sh


################################################
# Install Nginx, MariaDB, and the htpassword utility, which is a part of apache2-utils.
# Use apt_safe() from vultr-helper.sh to avoid database locks.
apt_safe nginx mariadb-server apache2-utils

################################################
# Add basic authentication to the default Nginx site.
sed -i'' "/^\tlocation \/ {$/a \ \t\tauth_basic \"Restricted Content\";\n\t\tauth_basic_user_file /etc/nginx/.htpasswd;" /etc/nginx/sites-enabled/default

################################################
## Prepare server snapshot for Marketplace
clean_system
