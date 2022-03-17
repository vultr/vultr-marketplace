#!/bin/bash

# Lets execute the real install script in a way that creates
# logs for the process so failures can be diagnosed
/root/app_binaries/install.sh > /var/log/app_install.log 2>&1
