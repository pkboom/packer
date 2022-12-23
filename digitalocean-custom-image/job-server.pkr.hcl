// https://developer.hashicorp.com/packer/plugins/builders/digitalocean
packer {
    required_plugins {
        digitalocean = {
            version = ">= 1.0.4"
            source  = "github.com/digitalocean/digitalocean"
        }
    }
}

source "digitalocean" "ubuntu" {
    region = "sfo3"
    size = "s-1vcpu-1gb"
    image = "ubuntu-20-04-x64"
    ssh_username = "root" // default username for ubuntu
    snapshot_name = "job-server-${formatdate("YYYY_MM_DD, hh:mm", timestamp())}"
}

// https://developer.hashicorp.com/packer/docs/templates/hcl_templates/blocks/build
build {
    name = "developer-environment"
    sources = [
        "source.digitalocean.ubuntu"
    ]
    // https://developer.hashicorp.com/packer/docs/templates/hcl_templates/blocks/build/provisioner
    // https://developer.hashicorp.com/packer/docs/provisioners
    provisioner "shell" {
        // scripts = fileset(".", "scripts/{install,secure}.sh")
        scripts= [
            "scripts/base.sh"
        ]
    }
    provisioner "ansible" {
      playbook_file = "./playbook.yml"
    }
}
