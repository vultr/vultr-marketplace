# Vultr Marketplace Vendor Tools

This repository has helper scripts and examples for Vultr Marketplace vendors. You'll also find the Marketplace Builder, an example automated build script. To learn more about the Vultr Marketplace, please see [our documentation library](https://www.vultr.com/docs/vultr-marketplace).

## Apply to Become a Vendor

If you have an application that you'd like to publish in the Vultr Marketplace, [please apply to become a vendor](https://www.vultr.com/marketplace/become-a-verified-vendor/).

### Table of Contents

* [Apply to Become a Vendor](#apply-to-become-a-vendor)
* [Vultr Marketplace Process Overview](#vultr-marketplace-process-overview)
* [Vultr Helper Script](#vultr-helper-script)
* [Example Automation with Packer](#example-automation-with-packer)
* [Sample Application](#sample-application)
* [Marketplace Builder](#marketplace-builder)

## Vultr Marketplace Process Overview

This is a high-level overview of the Vultr Marketplace build process, with links to documentation. If you are new to the Vultr Marketplace, please start with the [Vultr Marketplace Introduction](https://www.vultr.com/docs/vultr-marketplace).

1. [Create a vendor account and update your contact information](https://www.vultr.com/docs/marketplace-vendor-settings).
1. [Create a new application profile](https://www.vultr.com/docs/marketplace-applications).
1. [Update the general information](https://www.vultr.com/docs/vultr-marketplace-general-information).
1. [Update the support information](https://www.vultr.com/docs/vultr-marketplace-support-information).
1. [Create application variables if you need auto-generated passwords](https://www.vultr.com/docs/vultr-marketplace-application-variables).
1. [Create your application instructions](https://www.vultr.com/docs/vultr-marketplace-application-instructions). See our [formatting tips](https://www.vultr.com/docs/vultr-marketplace-tips-for-readme-and-app-instructions).
1. [Upload your application screenshots and featured images](https://www.vultr.com/docs/vultr-marketplace-gallery).
1. [Verify your application has the required software installed](https://www.vultr.com/docs/vultr-marketplace-requirements). This GitHub repository has helper scripts and examples.
1. [Create your provisioning scripts](https://www.vultr.com/docs/vultr-marketplace-variables-and-provisioning-scripts).
1. [Create a snapshot of your application](https://www.vultr.com/docs/vultr-marketplace-snapshots).
1. [Assign your snapshot as a Vultr Marketplace build](https://www.vultr.com/docs/vultr-marketplace-builds).
1. [Publish your application in the Vultr Marketplace](https://www.vultr.com/docs/vultr-marketplace-publication-settings).

## Vultr Helper Script

The scripts in this repository use helper functions found in [vultr-helper.sh](/helper-scripts/vultr-helper.sh). You can use these in your scripts and modify them as needed.

## Example Automation with Packer

The [packer-example](/packer-example) directory is a stripped-down template for creating an automated Vultr Marketplace build pipeline.

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

## Sample Application

The [sample application](/sample-app) installs Nginx, MariaDB, and uses the Vultr application variable feature. It creates a database user and sets up basic authentication for the web server. We have a [complete walkthrough of this sample app in our documentation library](https://www.vultr.com/docs/how-to-build-an-example-vultr-marketplace-application).

## Marketplace Builder

For quick prototyping or to learn how the Vultr Marketplace works, you can use the [Vultr Marketplace Builder](/marketplace-builder). It creates Vultr Marketplace snapshots with the correct version of cloud-init installed. Marketplace Builder can create snapshots for:

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

        $ export VULTR_API_KEY=<Your API Key>

1. If you desire a debug log, export these two variables:

        $ export PACKER_LOG=1
        $ export PACKER_LOG_PATH=packer.log

### Instructions

1. Clone this repository to your workstation.

        $ git clone https://github.com/vultr/vultr-marketplace.git

1. Run the Marketplace Builder.

        $ cd vultr-marketplace/marketplace-builder
        $ ./marketplace-builder.sh

The Marketplace Builder prompts you to select one OS or build all snapshots in a batch. When finished, the script creates snapshots named `MKT-<OS> <Date Time>` in your Vultr account, ready to be added to the Vultr Marketplace.

