#!/bin/bash
################################################
## Build example snapshot for Vultr Marketplace
## Tested on Debian 10
##
## Prerequisites
chmod +x /root/vultr-helper.sh
. /root/vultr-helper.sh
install_cloud_init latest

################################################
## Install your app here.

################################################
## Prepare server snapshot for Marketplace
clean_system
