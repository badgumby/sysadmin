#!/bin/bash

PROJECTNAME="Example-Project"
EXTERNALGROUP="Example-External-Group"

echo -e "Select option: \n1) $PROJECTNAME admin\n2) $EXTERNALGROUP user"
read -p "Option: " numberoption
case $numberoption in

        1)
                echo "Creating $PROJECTNAME admin"
				read -p "Please enter the username: " USERNAME1
				useradd -M -s /bin/false $USERNAME1
				passwd $USERNAME1
				usermod -g $PROJECTNAME $USERNAME1
				setfacl -Rm d:user:$USERNAME1:rwx /home/SFTP/$PROJECTNAME
		echo "Account created for user $USERNAME1"
		exit
                ;;

        2)
                echo "Creating $EXTERNALGROUP user"
				read -p "Please enter the username: " USERNAME2
				useradd -M -s /bin/false $USERNAME2
				passwd $USERNAME2
				usermod -g $EXTERNALGROUP $USERNAME2
				setfacl -Rm d:user:$USERNAME2:rwx /home/SFTP/$PROJECTNAME/$EXTERNALGROUP
        	echo "Account created for user $USERNAME2"
	        exit
                ;;
        *) echo "Exiting without creating a user."
            ;;
esac
