#!/bin/bash

while true
do
    clear

    echo "======================================"
    echo "        Service Management Lab        "
    echo "======================================"
    echo
    echo "1) Check Service Status."
    echo "2) Start Service"
    echo "3) Stop Service"
    echo "4) Restart Service"
    echo "5) View Logs"
    echo "6) Enable Service at Boot"
    echo "7) Disable Service at Boot"
    echo "8) Check if Service exists"
    echo "9) Exit"
    echo

    read -p "Select an option: " choice

    case $choice in

        1)
	    read -p "Service name: " service
           
	    echo
	    echo "================"
	    echo " $service status"
	    echo "================"
	    echo

	    systemctl status "$service"
	    ;;

        2)
            read -p "Service name: " service

	    echo
	    echo "=================="
	    echo " Starting $service"
	    echo "=================="
	    echo

            sudo systemctl start "$service"

	    if systemctl is-active --quiet "$service"; then
	        echo "[SUCCESS] $service is now running."
	    else
                echo "[FAILED] $service failed to start."
	    fi
            ;;

        3)
            read -p "Service name: " service

	    echo
	    echo "=================="
	    echo " Stopping $service"
	    echo "=================="
	    echo

            sudo systemctl stop "$service"

	    if ! systemctl is-active --quiet "$service"; then
		echo "[SUCCESS] $service is now stopped."
	    else
		echo "[FAILED] $service failed to stop."
	    fi
            ;;

        4)
            read -p "Service name: " service

	    echo
	    echo "===================="
	    echo " Restarting $service"
	    echo "===================="
	    echo

            sudo systemctl restart "$service"

	    if systemctl is-active --quiet "$service"; then
		echo "[SUCCESS] $service is now restarting."
	    else
		echo "[FAILED] $service failed to restart."
            fi
            ;;

        5)
            read -p "Service name: " service

	    echo
	    echo "=========================="
	    echo " Viewing Logs for $service"
	    echo "=========================="
	    echo

            journalctl -u "$service" -n 20 --no-pager

	    if systemctl list-unit-files | grep -q "^&service"; then
		 journalctl -u "$service" -n 20 --no-pager
            else
                echo "Service '$service' was not found."
            fi
            ;;
	 
        6)
	     read -p "Service name: " service

	     echo
	     echo "=================="
	     echo " Enabling $service"
	     echo "=================="
	     echo

             sudo systemctl enable "$service"

	     if systemctl is-active --quiet "$service"; then
		 echo "[SUCCESS] $service is enabled."
             else
		 echo "[FAILED] $serviced is still diabled."
	     fi
             ;;
        
        7)
             read -p "Service name: " service

	     echo
	     echo "==================="
	     echo " Disabling $service"
	     echo "==================="
	     echo

             sudo systemctl disable "$service"

	     if systemctl is-active --quiet "$service"; then
		 echo "[SUCCESS] $service is diabled."
	     else
		 echo "[FAILED] $service is still enabled."
	     fi
             ;;

        8)
             read -p "Service name: " service

             if systemctl list-unit-files | grep "^&service"; then
		 echo "$service exists."
	     else
	         echo "$service does not exist."
             fi		 
             ;;	     

        9)
            exit 0
            ;;

        *)
            echo "Invalid Selection."
            ;;
    esac

    echo
    read -p "Press Enter to Continue..."
done


