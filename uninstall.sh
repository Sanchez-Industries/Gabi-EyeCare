#!/bin/bash

#enable and start this addons
systemctl disable --now --user gabi-eyecare.timer

#delete the configurations to the system disk
sudo rm -f /etc/systemd/user/gabi-eyecare.service
sudo rm -f /etc/systemd/user/gabi-eyecare.timer

#delete additionnals commands to the system disk
sudo rm -f /usr/local/bin/gabi-eyecare

#delete installed dependences (deletion of required packages)
sudo pacman -Rcc gammastep


#unset and remove the ENV_VARS (required for this)

