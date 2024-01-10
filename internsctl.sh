#!/bin/bash

# internsctl - v0.1.0

function print_help {
    echo "Usage: internsctl [options]"
    echo "Options:"
    echo "  -h, --help                      Show help message"
    echo "  -v, --version                   Show command version"
    echo "  -g, --greet                     Greet the user"
    echo "  cpu getinfo                     Display CPU information and perform operations"
    echo "  memory getinfo                  Display memory information and perform operations"
    echo "  user create <username>          Create a new user with home directory"
    echo "  user list                       List all regular users"
    echo "  user list --sudo-only           List users with sudo permissions"
    echo "  file getinfo <file-name>        Display file information"
    echo "  file getinfo [options] <file-name>"
    echo "    --size, -s                    Print file size"
    echo "    --permissions, -p             Print file permissions"
    echo "    --owner, -o                   Print file owner"
    echo "    --last-modified, -m           Print last modified time"
    echo
    echo "For more information, see 'man internsctl'."
}

function print_manual {
    echo "internsctl(1) - User command for various operations"
    echo
    echo "NAME"
    echo "    internsctl - perform various operations on a Linux system"
    echo
    echo "SYNOPSIS"
    echo "    internsctl [options]"
    echo "    internsctl cpu getinfo"
    echo "    internsctl memory getinfo"
    echo "    internsctl user create <username>"
    echo "    internsctl user list [--sudo-only]"
    echo "    internsctl file getinfo <file-name>"
    echo "    internsctl file getinfo [options] <file-name>"
    echo
    echo "DESCRIPTION"
    echo "    internsctl is a command-line utility for performing various operations on a Linux system."
    echo
    echo "OPTIONS"
    echo "    -h, --help"
    echo "        Show help message"
    echo
    echo "    -v, --version"
    echo "        Show command version"
    echo
    echo "    -g, --greet"
    echo "        Greet the user"
    echo
    echo "    cpu getinfo"
    echo "        Display CPU information and perform operations"
    echo
    echo "    memory getinfo"
    echo "        Display memory information and perform operations"
    echo
    echo "    user create <username>"
    echo "        Create a new user with home directory"
    echo
    echo "    user list [--sudo-only]"
    echo "        List all regular users or users with sudo permissions"
    echo
    echo "    file getinfo <file-name>"
    echo "        Display file information"
    echo
    echo "    file getinfo [options] <file-name>"
    echo "        Display specific information about a file"
    echo
    echo "    --size, -s"
    echo "        Print file size"
    echo
    echo "    --permissions, -p"
    echo "        Print file permissions"
    echo
    echo "    --owner, -o"
    echo "        Print file owner"
    echo
    echo "    --last-modified, -m"
    echo "        Print last modified time"
    echo
    echo "For more information and examples, visit: https://yourcommanddocumentation.com"
}

function get_cpu_info {
    echo "CPU Information (similar to lscpu):"
    lscpu
    # Perform additional operations if needed
    # Add your custom commands here
}

function get_memory_info {
    echo "Memory Information (similar to free):"
    free
    # Perform additional operations if needed
    # Add your custom commands here
}

function create_user {
    if [ -z "$2" ]; then
        echo "Error: Missing username. Usage: internsctl user create <username>"
        exit 1
    fi

    username="$2"

    # Create user with home directory
    sudo useradd -m "$username"

    echo "User '$username' created with home directory."
}

function list_users {
    if [ "$2" == "--sudo-only" ]; then
        # List users with sudo permissions
        echo "Users with sudo permissions:"
        grep -Po '^sudo.*:\K.*$' /etc/group | tr ',' '\n'
    else
        # List all regular users
        echo "Regular users:"
        getent passwd | grep -vE "/nologin$|/false$" | cut -d: -f1
    fi
}

function get_file_info {
    if [ -z "$2" ]; then
        echo "Error: Missing file name. Usage: internsctl file getinfo <file-name>"
        exit 1
    fi

    filename="$2"
    size=""
    permissions=""
    owner=""
    last_modified=""

    while [ $# -gt 2 ]; do
        case "$3" in
            --size | -s)
                size=$(stat -c %s "$filename")
                ;;
            --permissions | -p)
                permissions=$(stat -c %A "$filename")
                ;;
            --owner | -o)
                owner=$(stat -c %U "$filename")
                ;;
            --last-modified | -m)
                last_modified=$(stat -c %y "$filename")
                ;;
            *)
                echo "Error: Unknown option. Use 'internsctl --help' for usage information."
                exit 1
                ;;
        esac
        shift
    done

    echo "File: $filename"
    [ -n "$permissions" ] && echo "Permissions: $permissions"
    [ -n "$size" ] && echo "Size(B): $size"
    [ -n "$owner" ] && echo "Owner: $owner"
    [ -n "$last_modified" ] && echo "Last Modified: $last_modified"
}

function greet_user {
    echo "Hello, Intern!"
}

# Parse command-line arguments
case "$1" in
    -h | --help)
        print_help
        ;;
    -v | --version)
        echo "internsctl v0.1.0"
        ;;
    -g | --greet)
        greet_user
        ;;
    cpu_getinfo)
        get_cpu_info
        ;;
    memory_getinfo)
        get_memory_info
        ;;
    user_create)
        create_user "$@"
        ;;
    user_list)
        list_users "$@"
        ;;
    file_getinfo)
        get_file_info "$@"
        ;;
    *)
        echo "Error: Unknown option. Use 'internsctl --help' for usage information."
        exit 1
        ;;
esac

exit 0

