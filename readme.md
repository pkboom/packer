# Packer

```sh
packer validate <packer-file> # or '.'

packer build <packer-file> # or '.'

packer build -var "infra_env=staging" <packer-file> # or '.'

packer validate -var "infra_env=staging" -var "vault_pass=<vault-pass>" <packer-file> # or '.'

packer build -var "infra_env=staging" -var "vault_pass=<vault-pass>" <packer-file> # or' '.

# run the above Ansible provisioner in Packer with
ANSIBLEPW=`cat .vault` # pass the content of .vault to ANSIBLEPW

packer build \
    -var "infra_env=staging" \
    -var "vault_pass=$ANSIBLEPW" \
    <packer-file> # or' '.
```

# Managing Servers

Ansible has a default `inventory file` used to define which servers it will manage.

```sh
# move the default one so you can reference it later.
sudo mv /etc/ansible/hosts /etc/ansible/hosts.orig

code /etc/ansible/hosts
```

https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#inventory-basics-formats-hosts-and-groups

/etc/ansible/hosts

```
mail.example.com

[web-ip]
192.168.22.10
192.168.22.11

[webservers]
foo.example.com
bar.example.com

[dbservers]
one.example.com
two.example.com
```
