#!/bin/bash

#check updates with pacman
sudo pacman -Syu

#install dependences (required packages) + python3 to be sure system have python3 installed...
sudo pacman -S gammastep python3 nano

#copy the configurations to the system disk
sudo cp systemd-configs/service/gabi-eyecare.service /etc/systemd/user/gabi-eyecare.service
sudo cp systemd-configs/timer/gabi-eyecare.timer /etc/systemd/user/gabi-eyecare.timer

#copy additionnals commands to the system disk
sudo cp scripts/addons-commands/gabi-eyecare /usr/local/bin/gabi-eyecare

#set rights of access
sudo chown root:root /etc/systemd/user/gabi-eyecare.service
sudo chown root:root /etc/systemd/user/gabi-eyecare.timer
sudo chown root:root /usr/local/bin/gabi-eyecare
sudo chmod a+x /usr/local/bin/gabi-eyecare

#set and export the ENV_VARS (required for this)
sudo python3 scripts/custom-install-scripts/ENV_VARS-setter-script.py

#enable and start this addons
systemctl enable --now --user gabi-eyecare.timer

#display an thanks message and contact information
echo "Thank you for this choice ! more light than redshift ! hooo Yeah!!"
echo "Gabi-EyeCare v1 - by Rick Sanchez D-634"
echo "Configuration preset from: https://github.com/sanchez-industries"
echo "( -- RECOMMENDED: REBOOT NOW TO START USAGE OF THIS ADDED CONFIGURATION -- )"