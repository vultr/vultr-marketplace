# Vultr Marketplace Vendor Tools

This repository has helper scripts for Vultr Marketplace vendors. You'll also find the Marketplace Builder, an example automated build script. To learn more about the Vultr Marketplace, please see [our documentation library](https://www.vultr.com/docs/vultr-marketplace).

If you have an application that you'd like to publish in the Vultr Marketplace, [please apply to become a vendor](https://www.vultr.com/marketplace/become-a-verified-vendor/).

## Overview

The following steps are a high-level overview of the Vultr Marketplace build process. Follow the documentation links for more details.

1. [Create a vendor account](https://www.vultr.com/docs/marketplace-vendor-settings) and update your contact information.
1. Create a new [Application Profile](https://www.vultr.com/docs/marketplace-applications).
1. Update the [General Information](https://www.vultr.com/docs/vultr-marketplace-general-information) and [Support Information](https://www.vultr.com/docs/vultr-marketplace-support-information).
1. If you need an auto-generated password, set up your [Application Variables](https://www.vultr.com/docs/vultr-marketplace-application-variables).
1. Create your [application instructions](https://www.vultr.com/docs/vultr-marketplace-application-instructions). See our formatting tips for [Readme and App Instructions](https://www.vultr.com/docs/vultr-marketplace-tips-for-readme-and-app-instructions).
1. Upload your [application screenshots and featured images](https://www.vultr.com/docs/vultr-marketplace-gallery).
1. Make sure your application meets the [Vultr Marketplace](https://www.vultr.com/docs/vultr-marketplace-requirements) requirements. This GitHub repository has helper scripts to assist this process.
1. [Create provisioning scripts](https://www.vultr.com/docs/vultr-marketplace-variables-and-provisioning-scripts) to perform any required actions after a customer deploys your app.
1. [Create a snapshot](https://www.vultr.com/docs/vultr-marketplace-snapshots) of your application.
1. Assign your snapshot as a [Vultr Marketplace build](https://www.vultr.com/docs/vultr-marketplace-builds).
1. [Publish your application](https://www.vultr.com/docs/vultr-marketplace-publication-settings) in the Vultr Marketplace.

## Vultr Helper Script

The scripts in this repository use the `vultr-helper.sh` helper functions. You can use these in your scripts and modify them as needed. You'll find `vultr-helper.sh` in the example-scripts directory.

## Example Automation with Packer

The packer-example directory is a template for creating an automated Vultr Marketplace build pipeline. It's a stripped-down example pulled from the Marketplace Builder, without all the wrappers.

1. If you desire a debug log, export these two variables:

        export PACKER_LOG=1
        export PACKER_LOG_PATH=packer.log

1. Use `packer init` to automatically download the Vultr Packer Plugin.

        packer init ubuntu2004.pkr.hcl

1. Use `packer build` to automatically deploy a server, prepare it, make a snapshot, and then destroy the original server.

        packer build ubuntu2004.pkr.hcl

The result is an Ubuntu 20.04 LTS snapshot suitable for the Vultr Marketplace.

## Marketplace Builder

For quick prototyping or to learn how the Vultr Marketplace works, you can use the Vultr Marketplace Builder. It creates Vultr Marketplace snapshots with the correct version of cloud-init installed. Marketplace Builder can create snapshots for:

* CentOS 7
* CentOS 8
* Debian 10
* Ubuntu 18.04 LTS
* Ubuntu 20.04 LTS

### Requirements

Marketplace Builder runs in `bash` or `zsh`. It has been tested on macOS, Ubuntu 20.04, and Windows using Ubuntu under WSL.

1. Install [HashiCorp Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli).
1. Verify your workstation's IP address is in your [Vultr API access control list](https://my.vultr.com/settings/#settingsapi).
1. Publish your API key.

        export VULTR_API_KEY=<Your API Key>

### Instructions

1. Clone this repository to your workstation.

        $ git clone https://github.com/vultr/vultr-marketplace.git

1. Run the Marketplace Builder.

        $ cd vultr-marketplace/marketplace-builder
        $ ./marketplace-builder.sh

Marketplace Builder prompts you to select one OS or build all snapshots in a batch. The script creates Vultr Marketplace snapshots named `MKT-<OS> <Date Time>` in your Vultr account, ready to be added to the Vultr Marketplace.
