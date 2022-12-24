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

# SSH into new server

```sh
ssh -o "UserKnownHostsFile=/dev/null" admin@123.123.123.123
# -o: options
# UserKnownHostsFile parameter specifies the database file to use for storing the user host keys (default is ~/.ssh/known_hosts)
# UserKnownHostsFile=/dev/null: store user host keys in /dev/null, meaning discard it.
```

- [ ] doctl file exist in /usr/local/bin
- [ ] ssh with key
- [ ] what groups a sudo belongs to
- [ ] git pull
- [ ] install app and set up
- [ ] install mysql set up
- [ ] set up nginx
- [ ] set up TLS certificates
