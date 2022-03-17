#!/bin/bash
################################################
## Prerequisites
wget -O vultr-helper.sh https://raw.githubusercontent.com/vultr/vultr-marketplace/main/helper-scripts/vultr-helper.sh
chmod +x vultr-helper.sh
. vultr-helper.sh

################################################
## Prepare server for Marketplace snapshot
clean_system
