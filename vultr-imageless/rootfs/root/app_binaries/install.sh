#!/bin/bash

# Make it so all commands are logged to the console
# so they end up in the log file
set -x

# This is automatically included in every imageless install
# as a vendor-script to make common procedures easier. It
# will appear on all images, Vultr ones and Custom alike.
# URL: https://raw.githubusercontent.com/vultr/vultr-marketplace/main/helper-scripts/vultr-helper.sh
. /var/lib/vultr/vultr_app.sh



echo "You can do anything you like in this bash script, or any other"
echo "There is no limit to the file directory structure of rootfs either"
