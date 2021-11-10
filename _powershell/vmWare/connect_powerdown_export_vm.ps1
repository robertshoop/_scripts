#Cmdlets to connect to vSphere server and export a VM

# Connect to VMware host
Connect-VIServer SERVERNAME -user USERNAME -password PASSWORD

# Get VM information
Get-VM -Name SERVERFQDN.FQDN.TLD

# Shut down the VM
Get-VM -Name SERVERFQDN.FQDN.TLD | Shutdown-VMGuest -Confirm:$false

# Export an OVA of the VM
Get-VM -Name SERVERFQDN.FQDN.TLD | Export-VApp -Destination `C:\_vmware` -Format OVA