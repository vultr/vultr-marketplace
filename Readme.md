# Vultr Marketplace Vendor Tools

This repository has helper scripts and examples for Vultr Marketplace vendors. You'll also find the Marketplace Builder, an example automated build script. To learn more about the Vultr Marketplace, please see [our documentation library](https://www.vultr.com/docs/vultr-marketplace).

## Apply to Become a Vendor

If you have an application that you'd like to publish in the Vultr Marketplace, [please apply to become a vendor](https://www.vultr.com/marketplace/become-a-verified-vendor/).

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

The scripts in this repository use helper functions in [vultr-helper.sh](/helper-scripts/vultr-helper.sh). You can adapt these as needed in your scripts.

## Marketplace Builder

For quick prototyping or to learn how the Vultr Marketplace works, you can use the [Vultr Marketplace Builder](/marketplace-builder). See [the Readme](/marketplace-builder/Readme.md) for more information.

## Example Automation with Packer

The [packer-example](/packer-example) directory is a template for creating an automated Vultr Marketplace build pipeline. See [the Readme](/packer-example/Readme.md) for more information.

## Sample Application

The [sample application](/sample-app) installs Nginx, MariaDB, and uses the Vultr application variable feature. It creates a database user and sets up basic authentication for the web server. We have a [complete walkthrough of this sample app in our documentation library](https://www.vultr.com/docs/how-to-build-an-example-vultr-marketplace-application).
