#!/bin/bash

# Function to add a user
add_user() {
    read -p "Enter username: " username
    sudo useradd $username
    echo "User '$username' added successfully."
}

# Function to modify a user
modify_user() {
    read -p "Enter username to modify: " username
    sudo usermod $username
    echo "User '$username' modified successfully."
}

# Function to list all users
list_users() {
    echo "List of users:"
    getent passwd | cut -d: -f1
}

# Function to add a group
add_group() {
    read -p "Enter group name: " groupname
    sudo groupadd $groupname
    echo "Group '$groupname' added successfully."
}

# Function to modify a group
modify_group() {
    read -p "Enter group name to modify: " groupname
    sudo groupmod $groupname
    echo "Group '$groupname' modified successfully."
}

# Function to list all groups
list_groups() {
    echo "List of groups:"
    getent group | cut -d: -f1
}

# Function to enable a user
enable_user() {
    read -p "Enter username to enable: " username
    sudo usermod -U $username
    echo "User '$username' enabled successfully."
}

# Function to disable a user
disable_user() {
    read -p "Enter username to disable: " username
    sudo usermod -L $username
    echo "User '$username' disabled successfully."
}

# Function to show user details
show_user_details() {
    read -p "Enter username to show details: " username
    echo "Details for user '$username':"
    sudo id $username
}

# Main menu
while true; do
    echo "Select an action:"
    echo "1. Add User"
    echo "2. Modify User"
    echo "3. List Users"
    echo "4. Add Group"
    echo "5. Modify Group"
    echo "6. List Groups"
    echo "7. Enable User"
    echo "8. Disable User"
    echo "9. Show User Details"
    echo "0. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) add_user ;;
        2) modify_user ;;
        3) list_users ;;
        4) add_group ;;
        5) modify_group ;;
        6) list_groups ;;
        7) enable_user ;;
        8) disable_user ;;
        9) show_user_details ;;
        0) echo "Exiting..."; exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
