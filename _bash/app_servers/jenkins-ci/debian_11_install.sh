# WORK IN PROGRESS
# Tested on Debian 11 server install with latest updates as of 11-17-2021
apt-get install default-jre gnupg2 apt-transport-https wget -y

# Add Jenkins repo and key
wget https://pkg.jenkins.io/debian-stable/jenkins.io.key
apt-key add jenkins.io.key
echo "deb https://pkg.jenkins.io/debian-stable binary/" | tee /etc/apt/sources.list.d/jenkins.list

# Run APT update
apt-get update -y

# Install Jenkins
apt-get install jenkins -y

# Check system status
systemctl status jenkins

# Check port usage for Jenkins
ss -antpl | grep 8080

# Show Jenkins password
cat /var/lib/jenkins/secrets/initialAdminPassword
