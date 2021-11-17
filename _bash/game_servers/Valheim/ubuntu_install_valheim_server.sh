#!/bin/bash

# WORK IN PROGRESS - v1
# Using Valve's documentation from https://developer.valvesoftware.com/wiki/SteamCMD to create this script
# Tested script on Ubuntu Server 21.10 base install with SSH Server and latest updates as of 11-16-2021.

# Assumptions are there is a user account named steam on the system already (default user for a Ubuntu Server install).

# Install multiverse repo, add i386 architecture, and update repos
sudo add-apt-repository multiverse -y
sudo dpkg --add-architecture i386
sudo apt update

# Dependancies before installing steamcmd
sudo apt install lib32gcc-s1 -y

# Auto accept Steam EULA
# echo steam steam/license note '' | debconf-set-selections
# echo steam steam/question select "I AGREE" | debconf-set-selections

# Install SteamCMD
sudo apt install steamcmd -y

# Run SteamCMD and install Valheim dedicated server to /usr/games/valheim
sudo /usr/games/steamcmd +force_install_dir /usr/games/valheim +login anonymous +app_update 896660 validate +quit

# Backup the /usr/games/valheim/start_server.sh file before making changes to it
sudo cp /usr/games/valheim/start_server.sh /usr/games/valheim/start_server_original.sh

# Asks the user on what they would like to change the server name, world name, password, and port to:
echo
echo "Please provide the following information for the Valheim Dedicated Server:"
echo "==========================================================================="
echo
echo "What would you like the name the Valheim server?:"
read valServerName
echo
echo "What TCP/IP port do you wish to run the Valheim server on? (default is 2456):"
read valServerPort
echo
echo "What would you like the name the Valheim world instance?"
read valWorldName
echo
echo "What would you like the password to be for the Valheim server"
echo "NOTE: The password needs to be at least 5 characters and the password can't be in the server name!"
read valServerPassword

# Use sed to change the properties of the /usr/games/valheim/start_server.sh file

sed -i "s/My server/$valServerName/g" "/usr/games/valheim/start_server.sh"
sed -i "s/2456/$valServerPort/g" "/usr/games/valheim/start_server.sh"
sed -i "s/Dedicated/$valWorldName/g" "/usr/games/valheim/start_server.sh"
sed -i "s/secret/$valServerPassword/g" "/usr/games/valheim/start_server.sh"

# Displays new server information
echo
echo "The following changes have been made to the Valheim Dedicated Server:"
echo
echo "The Server name has been changed to:" $valServerName
echo "The Server port is set to:" $valServerPort
echo "The World name is set to:" $valWorldName
echo "The password is set to:" $valServerPassword
echo

# Gives the user the command to run the dedicated server
echo "The server is now setup!"
echo
echo "To run the dedicated server enter the following command:"
echo 
echo "cd /usr/games/valheim/ && ./start_server.sh"
echo