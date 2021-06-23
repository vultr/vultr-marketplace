#!/bin/bash
################################################
## Prerequisites
chmod +x /root/vultr-helper.sh
. /root/vultr-helper.sh
error_detect_on
install_cloud_init latest
clean_cloud_init

################################################
## Install your app here.


################################################
## Prepare server snapshot for Marketplace
clean_system
