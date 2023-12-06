#!/bin/bash
#IS 480 -02
#Asia Tyes


#CAT l
#################################################################
#v-238215
#This is checking if ssh is installed
sshInstalled="$(sudo dpkg -l | grep openssh)"
if [[ $? -ne 0 ]]; then 
	echo "package openssh not installed"
	
	read -p "Would you like to install openssh? y/n: " confirm
	if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
		sudo apt install ssh
	fi
#This is installing ssh if confirmed
fi

#This checks to see if ssh is disabled, or not loaded 
sshLoaded="$(sudo systemctl status sshd.service | egrep -i "(active|loaded)")"
if [[ $? -ne 0 ]]; then 
	echo "openSSH service not active/loaded"

	read -p "Would you like to activate the ssh service? y/n: " confirm
	if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
		sudo systemctl enable sshd.service 
		sudo systemctl start sshd.service
	fi
fi
###################################################################
#v-238206
#This is showing a list of users with sudo permissions 
echo "The following users have sudo permissions:"
grep sudo: /etc/group | cut -d: -f4

#This is confirming that the list f users shown should have permissions
read -p "Do all users in this list require access to security functions? y/n: " confirm
if [[ $confirm == [nN] || $confirm == [nN][oO] ]]; then
	echo "Use the following command to remove a specific user from the sudo group:"
	echo "sudo gpasswd -d <username> sudo"
#If users on lists shouldn't have permissions then use command
fi
###################################################################
#v-238326
#This checks to make sure the telnet package is not installed
telnetInstalled="$(dpkg -l | grep telnetd)"

if [[ $telnetInstalled -eq 0 ]]; then
#This is to uninstall the telnet package
	read -p "Would you like to uninstall the telnet package? y/n: " confirm
	if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
		sudo apt-get remove telnetd
	fi
fi	



#CAT ll
####################################################################
#v-238197

isBannerEnabled="$(grep ^banner-message-enable*.true /etc/gdm3/greeter.dconf-defaults)"

if [[ $isBannerEnabled -ne 0 ]]; then
	read -p "Would you like to enable the login banner message?: " confirm
	if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
		sed -i '/banner-message-enable/c\banner-message-enable=true' /etc/gdm3/greeter.dconf-defaults
		sudo dconf update 
		sudo systemctl restart gdm3
	fi

fi




