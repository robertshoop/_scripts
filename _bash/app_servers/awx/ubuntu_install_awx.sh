#!/bin/bash
# Commands for this script were taken from the YouTube video https://www.youtube.com/watch?v=mTllPoQQFjg&t=1802s
# Credit goes to Calvin Remsburg
# Install K3S
curl -sfL https://get.k3s.io | sudo bash -

# Show status of K3S nodes running
kubectl get nodes

# Add the latest AWX operator to the local system
kubectl apply -f https://raw.githubusercontent.com/ansible/awx-operator/0.13.0/deploy/awx-operator.yaml

# Check the status of the Kubernetes pods
kubectl get pods -A

echo "What will the name of the AWX server be?"
read awxServerName

echo "What will be the FQDN / Hostname for the AWX server?:"
read awxServerNameFQDN

# Create a awx.yaml file in the home directory
echo "---" >> test.yaml
echo "apiVersion: awx.ansible.com/v1beta1" >> test.yaml
echo "kind: AWX" >> test.yaml
echo "metadata:" >> test.yaml
echo "  name: "$awxServerName >> test.yaml
echo "spec:" >> test.yaml
echo "  service_type: nodeport" >> test.yaml
echo "  ingress_type: none" >> test.yaml
echo "  hostname: "$awxServerNameFQDN >> test.yaml

# Placing a 60 second timer for infrastructure to be created from the .yaml file
sleep 60s

# 