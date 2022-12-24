// https://developer.hashicorp.com/packer/plugins/builders/digitalocean
packer {
  required_plugins {
      digitalocean = {
          version = ">= 1.0.4"
          source  = "github.com/digitalocean/digitalocean"
    }
  }
}

source "digitalocean" "experiment"{
  api_token= var.api_token
  region = "tor1"
  size = "s-1vcpu-1gb"
  image = "ubuntu-20-04-x64"
  ssh_username = "root" // default username for ubuntu
  snapshot_name = "${var.infra-name}-${var.infra-type}-${formatdate("YYYY-MM-DD-hh-mm", timestamp())}"
}

// https://developer.hashicorp.com/packer/docs/templates/hcl_templates/blocks/build
build {
  name = "developer-environment"
  sources = [
    "source.digitalocean.experiment"
  ]
  provisioner "shell"{
    scripts = [
      "./scripts/base.sh"
    ]
  }
  provisioner "ansible" {
    playbook_file = "./ansible/app.yml"
    extra_arguments = [
      "--extra-vars", "admin_password=${var.admin_password}"
    ]
  }
  post-processor "shell-local" {
    inline = [
      "echo go to digitalocean to ip address",
      "echo https://cloud.digitalocean.com/droplets"
    ]
    scripts = [
      "./scripts/post.sh"
    ]
  }
}