variable "vultr_api_key" {
  type      = string
  default   = "${env("VULTR_API_KEY")}"
  sensitive = true
}

packer {
    required_plugins {
        vultr = {
            version = ">=v2.3.2"
            source = "github.com/vultr/vultr"
        }
    }
}

source "vultr" "sample-app" {
  api_key              = "${var.vultr_api_key}"
  os_id                = "387"
  plan_id              = "vc2-1c-1gb"
  region_id            = "ewr"
  snapshot_description = "Sample App ${formatdate("YYYY-MM-DD hh:mm", timestamp())}"
  ssh_username         = "root"
  state_timeout        = "25m"
}

build {
  sources = ["source.vultr.sample-app"]

  provisioner "file" {
    source = "../helper-scripts/vultr-helper.sh"
    destination = "/root/vultr-helper.sh"
  }

  provisioner "file" {
    source = "setup-per-boot.sh"
    destination = "/root/setup-per-boot.sh"
  }

  provisioner "file" {
    source = "setup-per-instance.sh"
    destination = "/root/setup-per-instance.sh"
  }

  provisioner "shell" {
    script = "sample-app.sh"
    remote_folder = "/root"
    remote_file = "sample-app.sh"
  }
}
