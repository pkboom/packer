#! /usr/bin/env bash

# The -e option will cause a bash script to exit immediately
# when a command fails.
set -e

# Helps clear issues of not finding Ansible package,
# perhaps due to updates running when server is first spun up
sleep 30

# Don't prompt the user with configuration prompts
# https://linuxhint.com/debian_frontend_noninteractive/
export DEBIAN_FRONTEND="noninteractive"

# Install Ansible
echo ">>>>>>>>>>> INSTALLING ANSIBLE"
sudo apt-get update
sudo apt-get install -y ansible
