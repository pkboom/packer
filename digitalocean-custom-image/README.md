# Building custom Droplet images with Packer and Ansible

Agenda:

- Tools Overview
- Build an Image with Packer
- Configure the Image with Ansible
- Use Packer & Ansible to provision image
- Deploy a Drolet using this image

```sh
packer init .
# Installs plugin so that it knows how to provision digitalocean stuff.

ansible-playbook playbook.yml --check # validate

packer build .
```

> When creating an image based on your server, this might help.

<image width="500" src="additional_options2.png">

# doctl Command Line Interface (CLI)

https://docs.digitalocean.com/reference/doctl/

```sh
doctl compute size list # show a list of sizes of droplets available

# https://docs.digitalocean.com/reference/doctl/reference/compute/image/list
doctl compute image list --public # a list of images
```

# DigitalOcean Api Slugs

https://slugs.do-api.dev
