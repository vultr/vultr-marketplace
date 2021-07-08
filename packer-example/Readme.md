# Example Automation with Packer

This is a template for creating an automated Vultr Marketplace build pipeline.

1. Clone the repository to your workstation.

        $ git clone https://github.com/vultr/vultr-marketplace.git

1. Install [HashiCorp Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli).
1. Verify your workstation's IP address is in your [Vultr API access control list](https://my.vultr.com/settings/#settingsapi).
1. Publish your API key.

        $ export VULTR_API_KEY=<Your API Key>

1. If you desire a debug log, export these two variables:

        $ export PACKER_LOG=1
        $ export PACKER_LOG_PATH=packer.log

1. Change to the Packer example directory.

        $ cd vultr-marketplace/packer-example

1. Use `packer init` to automatically download the Vultr Packer Plugin.

        $ packer init packer-example.pkr.hcl

1. Use `packer build` to automatically deploy a server, prepare it, make a snapshot, and then destroy the original server.

        $ packer build packer-example.pkr.hcl

The result is an Ubuntu 20.04 LTS snapshot suitable for the Vultr Marketplace.