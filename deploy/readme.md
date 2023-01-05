# Add a server to inventory

```sh
# /etc/ansible/hosts
<host-ip>
```

# Create deploy keys

> This is done only one time for all servers.

```sh
ssh-keygen -q -t ed25519 -b 4096 -f ~/.ssh/deploy -N '' -C 'deploy@experiment.com'
# -N '': no passphrase
# -C: comment

# This will be used when git pulling from the server.
gh ssh-key add ~/.ssh/deploy.pub --title SSH_SERVER
```

# Set up ssh keys

## Add server to ~/.ssh/config

```
Host <server-name>
  HostName <ip> or <domain>
  AddKeysToAgent yes
  User deploy
  IdentityFile ~/.ssh/deploy
```

## Copy secret to repo

> This will be used when github actions access the server.

```sh
cd <repo>
gh secret set SSH_PRIVATE < ~/.ssh/deploy
```

<image width="500" src="secret.png">

## Clone an application onto server

```sh
ansible-playbook -u admin app.yml

ansible-playbook --private-key ~/.ssh/deploy -u deploy app.yml
```

# Remove authorized key

ssh deploy@<server-ip> "
sed -i '/REGEX_MATCHING_KEY/d' ~/.ssh/authorized_keys
"

# File permissions

```php
'disks' => [
    'public' => [
        'driver' => 'local',
        'root' => storage_path('app/public'),
        'url' => env('APP_URL').'/storage',
        'visibility' => 'public',
        'permissions' => [
            'file' => [
                'public' => 0664,
                'private' => 0600,
            ],
            'dir' => [
                'public' => 0775,
                'private' => 0700,
            ],
        ],
    ],
],
```
