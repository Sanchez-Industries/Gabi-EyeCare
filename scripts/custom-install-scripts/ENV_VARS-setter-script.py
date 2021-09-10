#!/usr/bin/python3
#coding: utf-8

from os import system

#execute edition script
edition_bash_script="""
sudo nano env-vars-configs/gammastep/geo-position-manual-settings/lat
sudo nano env-vars-configs/gammastep/geo-position-manual-settings/lon
sudo mkdir -p /var/Gabi-EyeCare/config/env_vars/gammastep/geo-position-manual-settings/
sudo mkdir -p /var/Gabi-EyeCare/config/env_vars/gammastep/geo-position-manual-settings/
sudo cp env-vars-configs/gammastep/geo-position-manual-settings/lat /var/Gabi-EyeCare/config/env_vars/gammastep/geo-position-manual-settings/lat
sudo cp env-vars-configs/gammastep/geo-position-manual-settings/lon /var/Gabi-EyeCare/config/env_vars/gammastep/geo-position-manual-settings/lon
"""
system(edition_bash_script)

#put the reading line of bash into global environment variables file of the system
env_var_setter_bash_script="""
LAT=$(cat /var/Gabi-EyeCare/config/env_vars/gammastep/geo-position-manual-settings/lat)
LON=$(cat /var/Gabi-EyeCare/config/env_vars/gammastep/geo-position-manual-settings/lon)\n"""

with open("/etc/environment", "a") as system_env_vars_file:
    system_env_vars_file.write(env_var_setter_bash_script)
    system_env_vars_file.close()
    
system(env_var_setter_bash_script)