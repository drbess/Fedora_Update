#!/bin/bash
#
################################ Fedora Workstation Upgrade Script ONLY ##############################
# Date: 2023-08-26
# Author: https://github.com/drbess
######################################################################################################
# Some options to consider. You can run this script as:
# 1. root or
# 2. use '\sudo bash fedora_upgradev0.2.bash\' if running as a regular user.
#######################################################################################################
echo "This script will upgrade your Fedora OS to the newest Fedora Workstation release"
echo
echo "Wait!! Checking to see if yo name is sudo"
########## START EDITING HERE ##########
date
echo "Checking exit status"
check_exit_status() {

        if [ $? -eq 0 ]
        then
           echo
           echo "Success"
           echo
        else

           echo
           echo "[ERROR] Process messed up my boi! "
           echo

           read -p "The last command exited with an error. Exit script? (yes/no)" answer

           if [ "$answer" == "yes" ]
           then
                exit 1
           fi

     fi
 }
greeting() {

        echo
        echo "Ok, $USER. We'll start with upgrade refresh ......"
        echo
}
upgrade_refresh() {

        dnf upgrade --refresh;
	echo "Now reboot your computer, then go to the next block"
        check_exit_status
}
dnf_plugin_system_upgrade() {
	
	echo "Installing dnf plugins. This is imperative to signing keys for higher releases"
	dnf install dnf-plugin-system-upgrade;
	echo "Downloading the updated package. You can change release version to you desired release"
	dnf system-upgrade download --releasever=38


}
cleanuptime() {

        sudo dnf autoremove -y;
}
bounce() {
        echo
        echo "---------------------------------"
        echo "- Ok We Good, Update Complete! -"
        echo "---------------------------------"
        echo
        exit
}
greeting
upgrade_refresh
cleanuptime

