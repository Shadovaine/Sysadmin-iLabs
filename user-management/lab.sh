#!/usr/bin/env bash

# User Management Lab
# This lab simulates a junior SysAdmin user creation workflow.

clear

LAB_USER=""

pause() {
    echo
    read -p "Press Enter to continue..."
}

show_header() {
    clear
    echo "====================================="
    echo "        User Management Lab"
    echo "====================================="
    echo
    echo "This lab will walk through creating a new Linux user."
    echo
}

create_user() {
    show_header
    
    read -p "Enter a new username: " username

    if [[ -z "$username" ]]; then
        echo "Error: username cannot be empty."
        pause
        return
    fi

    if id "$username" $>/dev/null; then
        echo "Error: user '$username' already exists."
        pause
        return
    fi

    read -s -p "Enter a password for $username: " password
    echo

    if [[ -z "$password" ]]; then
        echo "Error: password cannot be empty."
        pause
        return
    fi

    echo
    echo "Creating user..."

    echo "Checking username..."

    useradd -m -s /bin/bash "$username"

    if [[ $? -ne 0 ]]; then
        echo "Error: failed to create user."
        pause
        return
    fi

    echo "$username:$password" | sudo chpasswd

    if [[ $? -ne 0 ]]; then
        echo "Error: failed to set password."
        pause
        return
    fi

    LAB_USER="$username"

    echo
    echo "User '$username' created successfully."
    pause
}

verify_user() {
    show_header

    read -p "Enter username to verify: " username

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        pause
        return
    fi

    echo "Account info:"
    id "$username"

    echo
    echo "Password database entry:"
    getent passwd "$username"

    echo
    echo "Home directory:"
    ls -ld "/home/$username"
    
    pause
}

reset_user() {
    show_header

    read -p "Enter username to delete/reset: " username

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        pause
        return
    fi

    echo
    echo "Deleting user '$username' and home directory..."
    userdel -r "$username"

    if [[ $? -eq 0 ]]; then
        echo "User '$username' removed successfully."
    else
        echo "Error: failed to remove user '$username'."
    fi

    pause
}

main_menu() {
    while true; do
        show_header
        echo "Choose an option:"
        echo
        echo "1) Create a new user"
        echo "2) Verify an existing user"
        echo "3) Reset/delete a lab user"
        echo "4) Exit"
        echo
        read -p "Selection: " choice

        case "$choice" in
            1) create_user ;;
            2) verify_user ;;
            3) reset_user ;;
            4)
                echo
                echo "Exiting User Management Lab."
                exit 0
                ;;
            *)
                echo
                echo "Invalid selection."
                pause
                ;;
        esac
    done
}

main_menu
