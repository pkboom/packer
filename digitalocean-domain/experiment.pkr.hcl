// https://developer.hashicorp.com/packer/plugins/builders/digitalocean
packer {
  required_plugins {
      digitalocean = {
          version = ">= 1.0.4"
          source  = "github.com/digitalocean/digitalocean"
    }
  }
}

source "digitalocean" "this"{
  api_token= var.api_token
  region = "tor1"
  size = "s-1vcpu-1gb"
  image = "ubuntu-20-04-x64"
  ssh_username = "root" // default username for ubuntu
  snapshot_name = "${var.infra_name}-${var.infra_type}"
  // snapshot_name = "${var.infra_name}-${var.infra_type}-${formatdate("YYYY_MM_DD_hh_mm", timestamp())}"
}

// https://developer.hashicorp.com/packer/docs/templates/hcl_templates/blocks/build
build {
  name = "developer-environment"
  sources = [
    "source.digitalocean.this"
  ]
  provisioner "shell"{
    scripts = [
      "./scripts/base.sh"
    ]
  }

  // https://developer.hashicorp.com/packer/plugins/provisioners/ansible/ansible
  provisioner "ansible" {
    playbook_file = "./ansible/app.yml"
    extra_arguments = [
      "--extra-vars", 
      "admin_password=${var.admin_password}",
      "--extra-vars", 
      "deploy_password=${var.deploy_password}",
    ]
  }
}