# Set up ssh keys

- Add private key as a secret on github actions

```sh
cat ~/.ssh/id_ed25519 | pbcopy
```

> This will be used when github actions access the server.

<image width="500" src="secret.png">

- Add public key to github ssh

> This will be used when git pulling from the server.
>
> I don't have to do this. Because this key is already in use for my gh on local.

```sh
gh ssh-key add ~/.ssh/id_ed25519.pub --title SSH_SERVER
```

- Copy public key to authorized_keys on server

> I don't have to do this. Because ansible already did this for me.

```sh
scp ~/.ssh/id_ed25519.pub admin@<server-ip>:~/.ssh/

ssh admin@<server-ip> "
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
rm -f ~/.ssh/id_ed25519.pub
"
```

- Copy private key to server

```sh
scp ~/.ssh/id_ed25519 admin@<server-ip>:~/.ssh/
```

## Clone an application from github

```sh
ansible-playbook --private-key ~/.ssh/id_ed25519 -u admin app.yml
```

# Create ssh key

```sh
ssh-keygen -q -t ed25519 -b 4096 -f id_ed25519 -N '' -C 'admin@experiment.com'
# -N '': no passphrase
# -C: comment
```

# Remove authorized key

ssh admin@<server-ip> "
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

- [ ] use different keys. not mine.
