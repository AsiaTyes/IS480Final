README
ASIA TYES
IS 480-02
FINAL PROJECT
=============RESOURCES=========
Canonical Ubuntu 20.04 LTS
U_CAN_Ubuntu_20-04_LTS_V1R10_STIG.zip
U_CAN_Ubuntu_20-04_LTS_V1R10_STIG_Ansible.zip
You need a STIG Viewer to view the catergories 

===================DESCRIPTION==================
In this script there are four varying STIG rules, with commands on how to solve each.
There are 3 CAT one's and 1 CAT two, the different CATs means category. CAT l's being high severity than CAT ll. 
The first STIG shown in the script is V-238215.
This first rule is checking to see if openssh is installed, if the server package is not installed than that is a finding.
If there is a finding, the next commands listed for this STIG rule are installing the server package and checking if it is active/loaded. 
The second STIG shown in the script is V-238206
This rule is checking that the file "/etc/group" only has memebers who should have access to security fuctions have access. If the file shows users who shouldn't have access this is a finding.
To test this that command will list the users and ask if all the users shown should have permissions, if no the script will give the user a command they can use to remove users who shouldn't have access.
The third STIG shown in the script is V-238326
This rule is checking to se if the telnet package is installed, if the package is installed this is a finding.
The commands in the script will check to see if the telnet package is insatlled, then ask the user if they would like to remove the package. If the user confirms, the package will be removed from the system.
The fourth STIG shown in the script is V-238197
This rule checks to see if a banner message at user logon is enabled, if the output shows 'banner-message-enable=false' or is commented out this is a finding.
The script will then confimr with the user that they want the banner message enabled, this if yes it will update the banner message to enable it. Then it will restart to confirm that it has been enabled. 
 
