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
ssh -o UserKnownHostsFile=/dev/null -o PubkeyAuthentication=no admin@68.183.207.241
# -o: options
# UserKnownHostsFile parameter specifies the database file to use for storing the user host keys (default is ~/.ssh/known_hosts)
# UserKnownHostsFile=/dev/null: store user host keys in /dev/null, meaning discard it.
# PubkeyAuthentication=no: Disable public key authentication. Without it, if there are many
# private keys, ssh will try to log in using all private kyes, leading to many
# authentication failures before prompting for password.
```

# Remove a key

```sh
ssh-keygen -R <host>

ssh-keygen -R 165.22.237.44
```

# Ping

```sh
ansible all -m ping -u admin

ansible -k all -m ping -u vagrant
# -k: ask for password
# -u: log in as user
```

# Ansible Vault

```sh
ansible-vault create ansible/roles/user/vars/main.yml
New Vault password:

ansible-vault edit ansible/roles/user/vars/main.yml
```

- [ ] set up SSL certificates
- [ ] git pull for web
- [ ] install app and set up
- [ ] install mysql set up
- [ ] set up nginx
