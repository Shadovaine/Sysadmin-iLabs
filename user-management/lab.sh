#!/usr/bin/env bash

# User Management Lab
# This lab simulates a junior SysAdmin user creation workflow.

clear

echo "====================================="
echo "        User Management Lab"
echo "====================================="
echo
echo "This lab will walk through creating a new Linux user."
echo

read -p "Enter a new username: " username

echo
echo "Checking username..."

if [[ -z "$username" ]]; then
    echo "Error: username cannot be empty."
    exit 1
fi

if id "$username" &>/dev/null; then
    echo "Error: user '$username' already exists."
    exit 1
fi

echo "Username '$username' is available."
echo

read -s -p "Enter a password for $username: " password
echo

if [[ -z "$password" ]]; then
    echo "Error: password cannot be empty."
    exit 1
fi

echo
echo "Creating user..."

sudo useradd -m -s /bin/bash "$username"

if [[ $? -ne 0 ]]; then
    echo "Error: failed to create user."
    exit 1
fi

echo "$username:$password" | sudo chpasswd

if [[ $? -ne 0 ]]; then
    echo "Error: failed to set password."
    exit 1
fi

echo
echo "User created successfully."
echo

echo "Account info:"
id "$username"

echo
echo "Password database entry:"
getent passwd "$username"

echo
echo "Home directory:"
ls -ld "/home/$username"

echo
echo "Lab complete."
