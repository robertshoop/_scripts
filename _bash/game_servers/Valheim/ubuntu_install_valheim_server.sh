# Using Valve's documentation from https://developer.valvesoftware.com/wiki/SteamCMD to create this script
# Tested script on Ubuntu 21.10 with latest updates as of 11-16-2021
#
# Assumptions are there is a user account named steam on the system already (default user for a Ubuntu Server install).
#
# Install multiverse repo, add i386 architecture, and update repos
sudo add-apt-repository multiverse -y
sudo dpkg --add-architecture i386
sudo apt update

# Dependancies before instlal steamcmd
sudo apt install lib32gcc-s1 -y

# Auto accept Steam EULA
# echo steam steam/license note '' | debconf-set-selections
# echo steam steam/question select "I AGREE" | debconf-set-selections

# Install SteamCMD
sudo apt install steamcmd -y


# Run SteamCMD and install Valheim dedicated server to /usr/games/valheim
/usr/games/steamcmd +force_install_dir /usr/games/valheim +login anonymous +app_update 896660 validate +quit

# Change server name, password, and 