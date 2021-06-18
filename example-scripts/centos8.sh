#!/bin/bash
################################################
## Build example snapshot for Vultr Marketplace
## Tested on CentOS 8
##
## Prerequisites
chmod +x /root/vultr-helper.sh
. /root/vultr-helper.sh
error_detect_on
install_cloud_init latest
################################################

################################################
## Install your app here.
################################################

################################################
## Disable NetworkManager, replace with network-scripts on CentOS8.
disable_network_manager
## Prepare server snapshot for Marketplace
clean_system
################################################
