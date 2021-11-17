# WORK IN PROGRESS #
# A script to install a Valheim dedicated server in Debain Linux 11

# Add the packages needed to use add-apt-repository
apt install software-properties-common

#
dpkg --add-architecture i386; apt update;apt-get install steamcmd -y; ln -s /usr/games/steamcmd steamcmd;
