#!/bin/bash

# Check if script is running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run 'sudo' before this command"
  exit
fi

# Get arguments 1 and 2
echo "Enter your GitHub username: "
read name

echo "Enter your GitHub user email: "
read email

# Set the email and name
git config --global user.name $name
git config --global user.email $email

# Remove the credential.helper
sudo git config --system --unset credential.helper

# Set the credential.helper to cache for 115 days
git config --system credential.helper 'cache --timeout=9999999'
