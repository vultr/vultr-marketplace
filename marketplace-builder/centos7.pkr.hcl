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

source "vultr" "centos7" {
  api_key              = "${var.vultr_api_key}"
  os_id                = "167"
  plan_id              = "vc2-1c-1gb"
  region_id            = "ewr"
  snapshot_description = "MKT-CentOS 7 ${formatdate("YYYY-MM-DD hh:mm", timestamp())}"
  ssh_username         = "root"
  state_timeout        = "25m"
}

build {
  sources = ["source.vultr.centos7"]

  provisioner "file" {
    source = "../example-scripts/vultr-helper.sh"
    destination = "/root/vultr-helper.sh"
  }

  provisioner "shell" {
    script = "centos7.sh"
    remote_folder = "/root"
    remote_file = "centos7.sh"
  }
}
