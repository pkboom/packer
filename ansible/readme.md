> **Note**
> Edit /etc/ansible/hosts to include the host ip address.

# Install mysql and clone repository from github

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

- [ ] pull from github
- [ ] install various stuff
