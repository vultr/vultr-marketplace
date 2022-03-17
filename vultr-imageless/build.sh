#!/bin/bash

# This builds and outputs the imageless string for this app
# This will not produce an image but a sh file to use instead!

. imageless_tools.sh

set -eox pipefail

mkdir dist

# Generate an entire cloud-config formatted config
# for Cloud-Init from the rootfs folder
BINS="$(generate_binaries "./rootfs")"

# Use a base template cloud-config format config
cat image.yml > "./dist/myapp.sh"

# Add the generated binaries from before
echo "${BINS}" >> "./dist/myapp.sh"

# Use this to seperate files and parts to avoid having
# to use complicated multi-part formats
echo -e '\n#!vultr-vendor-part' >> "./dist/myapp.sh"

# Lets put a wrapper around the installer so we can have our own log
# files.
cat "./install.sh" >> "./dist/myapp.sh"

# Lets echo it out for our CI/CD for reference
cat "./dist/myapp.sh"
