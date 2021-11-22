#!/bin/bash
# Tested on Debian 11 with latest updates as of 11-21-2021
# Use this script to install the sudo package on a Debian 11 box and then grant a user sudo permissions:
# Run as root (if this is the first time running it) or a user with root / sudo permissions.

#
echo "What user needs to have sudo rights on this machine?:"
read sudoUserName

# Install sudo package
apt-get install sudo -y

# Add the user to the sudo group
/sbin/adduser $sudoUserName sudo
echo
echo "The user $sudoUserName will need to log out and then back into the server to have sudo permissions."
echo "As a test have $sudoUserName run ""sudo echo 'Hello, world!'"" (without double quotes) to test sudo permissions"
echo