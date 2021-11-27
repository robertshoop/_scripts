# NOT READY YET, DO NOT USE
# Auto install script for Debian 11 with Subspace Docker container on Debian 11

# Install WireGuard
apt install wireguard -y

# Install Docker Compose
apt install docker-compose -y

# Remove dnsmasq because it will run inside the container.
apt-get remove -y dnsmasq

# Set DNS server.
echo
echo "Enter the IP address of the nameserver you wish to use"
echo
read dnsNameServer
echo nameserver $dnsNameServer >/etc/resolv.conf

# Load modules

modprobe wireguard
modprobe iptable_nat
modprobe ip6table_nat

# Enable IP forwarding

echo "Configuring IP forwarding for IPv4 and IPv6"
echo
sysctl -w net.ipv4.ip_forward=1
sysctl -w net.ipv6.conf.all.forwarding=1
echo

# In progress of adding

echo "Please provide the HTTP hostname you wish to access the site from:"
echo "NOTE: You will need to create an DNS ""A"" record to the IP address"
read httpFQDNDomainName
echo "to point to this server and have ports enabled on your public IP address"

# Creat the docker container with options
docker create --name subspace --restart always --network host --cap-add NET_ADMIN --volume /usr/bin/wg:/usr/bin/wg --volume /data:/data --env SUBSPACE_HTTP_HOST=$subspace.shoop.cark.info subspace

echo
read "Do you wish to start the Docker container now?"
echo
docker start subspace