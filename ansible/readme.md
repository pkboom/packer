첨부처 다시 싹 다 해.

# Set up application

## Create ssh keys

> Important: This will be used on the server.

```sh
ssh-keygen -q -t ed25519 -b 4096 -f id_ed25519 -N '' -C 'admin@experiment.com'
# -N '': no passphrase
# -C: comment
```

## Add server public key to github

> This will be used when git pulling from the server.

```sh
gh ssh-key add ./id_ed25519.pub --title SSH_SERVER
```

## Create a deploy user and pull an application

```sh
ansible-playbook --private-key ./id_ed25519 app.yml -u admin
```

## Copy keys to deploy user

```sh
scp ./id_ed25519 deploy@143.198.44.59:~/.ssh/id_ed25519.pub
scp ./id_ed25519.pub deploy@143.198.44.59:~/.ssh/id_ed25519.pub
```

> **Note**
> Edit /etc/ansible/hosts to include the host ip address.

# Install clone repository from github

```sh
ansible-playbook -u admin --private-key ~/.ssh/id_ed25519 app.yml
```

# Difference between shell and command

_shell_: Execute shell commands on targets

> It is almost exactly like the command module but runs the command through a shell (/bin/sh) on the remote node.

_command_: Execute commands on targets

> The command(s) will not be processed through the shell, so variables like $HOME and operations like "<", ">", "|", ";" and "&" will not work. Use the shell module if you need these features.

Command offers you more security (or more so-called, isolation). In other words, your command execution is unaffected by the user's environment variable.

Whereas, shell is very similar to executing commands as yourself on a terminal.

# Set up ssh on github

Copy pub & private keys to github as secrets

```sh
cat ~/.ssh/github_actions | pbcopy
cat ~/.ssh/github_actions.pub | pbcopy
```

- [ ] git clone: file, folder permission, who should git clone?
- [ ] install various stuff
- [ ] pull from github
