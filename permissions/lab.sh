#!/usr/bin/env bash

LAB_DIR="/tmp/permissions-lab"
LAB_FILE="$LAB_DIR/secret.txt"

pause() {
    echo
    read -p "Press Enter to continue..."
}

show_header() {
    clear
    echo "============================"
    echo "       Permissions Lab      "
    echo "============================"
}

setup_lab() {
    mkdir -p "$LAB_DIR"
    echo "This is a restricted lab file. " > "$LAB_FILE"
    chmod 644 "$LAB_FILE"

    echo "Lab environment created."
    echo
    ls -l "$LAB_FILE"
    pause
}

view_permissions() {
    show_header

    if [[ ! -f "$LAB_FILE" ]]; then
        echo "lab file does not exist. Run setup first."
	pause
	return
    fi
    
    echo "Current permissions:"
    ls -l "$LAB_FILE"
    pause
}

change_permissions() {
    show_header

    if [[ ! -f "$LAB_FILE" ]]; then
        echo "Lab file does not exist. Run setup first."
	pause
	return
    fi

    echo "Current file."
    ls -l "$LAB_FILE"
    echo
    read -p "Enter numeric permission mode, example 600, 644, 755: " mode

    if [[ ! "$mode" =~ ^[0-7]{3}$ ]]; then
         echo "Error: enter a valid 3-digit permission mode."
	 pause
	 return
    fi

    chmod "$mode" "$LAB_FILE"

    echo 
    echo "Permission updated:"
    ls -l "$LAB_FILE"
    pause
}

explain_permissions() {
    show_header

    cat << "EOF"
Linux file permissions are shown like this:

-rw-r--r--

Breakdown:

-   file   type
rw- owner permissions
r-- group permissions
r-- other permissions

Numeric Examples:

600 = owner can read/write, nobody else
644 = owner can read/write, group/others can read
755 = owner can read/write/execute, group/others can read/execute

Permission Values:

4 = read
2 = write
1 = execute
EOF
    pause
}

reset_lab() {
    show_header

    rm -rf "$LAB_DIR"

    echo "Permission lab reset."
    pause
}

main_menu() {
    while true; do
        show_header
	echo "Choose an option:"
	echo 
	echo "1) Set up lab file."
	echo "2) View current permissions."
	echo "3) Change file permissions."
	echo "4) Explain permissions."
	echo "5) Reset lab"
	echo "6) Exit"
	echo
	read -p "Selection: " choice

	case "$choice" in
	    1) setup_lab ;;
	    2) view_permissions ;;
	    3) change_permissions ;;
	    4) explain_permissions ;;
	    5) reset_lab ;;
	    6)
	        echo
		echo "Exiting Permission Lab."
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
