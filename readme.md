# Packer

```sh
packer validate cloudcasts.json
packer build cloudcasts.json
packer build -var "infra_env=staging" cloudcasts.json
packer validate -var "infra_env=staging" -var "vault_pass=<vault-pass>" cloudcasts.json
packer build -var "infra_env=staging" -var "vault_pass=<vault-pass>" cloudcasts.json

# run the above Ansible provisioner in Packer with
ANSIBLEPW=`cat .vault` # pass the content of .vault to ANSIBLEPW

packer build \
    -var "infra_env=staging" \
    -var "vault_pass=$ANSIBLEPW" \
    cloudcasts-app.json
```
