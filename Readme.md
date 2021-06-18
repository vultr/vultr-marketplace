# Vultr Marketplace

## Example Scripts

`marketplace-builder.sh` builds Vultr Marketplace snapshots for testing. It runs in bash or zsh, and it's tested on Ubuntu 20.04 and macOS.

### Instructions

1. Install [HashiCorp Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli) on your Ubuntu or macOS workstation.
1. Add your workstation's IP address to your [Vultr API access control list](https://my.vultr.com/settings/#settingsapi).
1. Clone this repository to your workstation.

        $ git clone https://github.com/vultr/vultr-marketplace.git

1. Run the Marketplace Builder.

        $ cd example-scripts
        $ ./marketplace-builder.sh

You'll be prompted to select a single OS, or you can choose to build all OS snapshots in a batch. The script creates Marketplace snapshots in your account named "**MKT-{OS} {Date Time}**".
