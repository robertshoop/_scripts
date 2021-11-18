#!/bin/bash
#
# To download the script from a server, chmod the script, and run it use the below as a reference:
#
# wget http://192.168.1.211/debian_11_jenkins_install.sh && chmod +x debian_11_jenkins_install.sh && ./debian_11_jenkins_install.sh
#
# Tested on Debian 11 server install with latest updates as of 11-17-2021

# Install Default JRE (OpenJDK), GUNPG2, and HTTPS Transport packages
apt-get install default-jre gnupg2 apt-transport-https wget -y

# Add Jenkins repo and key
wget https://pkg.jenkins.io/debian-stable/jenkins.io.key
apt-key add jenkins.io.key
echo "deb https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list

# Run APT update
apt-get update -y

# Install Jenkins
apt-get install jenkins -y

echo
echo "========================================"
echo "!!! Jenkins Service Status !!!"
echo "========================================"
echo

# Check system status
systemctl status jenkins

echo
echo "====================================================="
echo "!!! Checking if port is open / Jenkins is running !!!"
echo "====================================================="
echo

# Check port usage for Jenkins
ss -antpl | grep 8080

echo
echo "========================================="
echo "!!! Jenkins first time login password !!!"
echo "========================================="
echo

echo
echo "========================================="
echo "!!! Jenkins first time login password !!!"
echo "========================================="
echo 
echo "Run cat /var/lib/jenkins/secrets/initialAdminPassword for the password"
echo
echo "The Jenkins server should be accessible at one of the IP addresses below followed by :8080 in a web browser"
echo
ip a | grep inet
echo