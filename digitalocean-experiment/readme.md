# Install DigitalOcean CLI

https://docs.digitalocean.com/reference/doctl/how-to/install/

```sh
packer validate -var-file="variables.pkrvars.hcl" .
packer init -var-file="variables.pkrvars.hcl" .
packer build -var-file="variables.pkrvars.hcl" .
```

# DigitalOcean Api Token

```sh
terraform console

yamldecode(file("/Users/keunbae/Library/Application Support/doctl/config.yaml"))["access-token"]
```
