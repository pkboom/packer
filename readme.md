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

# Difference between shell and command

_shell_: Execute shell commands on targets

> It is almost exactly like the command module but runs the command through a shell (/bin/sh) on the remote node.

_command_: Execute commands on targets

> The command(s) will not be processed through the shell, so variables like $HOME and operations like "<", ">", "|", ";" and "&" will not work. Use the shell module if you need these features.

Command offers you more security (or more so-called, isolation). In other words, your command execution is unaffected by the user's environment variable.

Whereas, shell is very similar to executing commands as yourself on a terminal.
