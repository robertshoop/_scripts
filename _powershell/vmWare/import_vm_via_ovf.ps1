#Do not use .OVA files as they currently do not work with this method, extract the .OVA files using 7-Zip and then point the cmdlets to the .OVF file that is extracted:

#Variables are below for refernece:
$sourceFile = "C:\_vmware\win11-client-01\win11-client-01.ovf"
$esxServerName = "buzzesx01"
$vmNewName = "win11-client-03"

Write-Host "Connecting to vSphere / ESX host." -foregroundcolor green -backgroundcolor black

Connect-VIServer -Server $esxServerName

# Import the vApp with the varibles above
Import-vApp -Source $sourceFile -VMHost $esxServerName -Name $vmNewName

# 

# Disconnect from the vSphere Server
Disconnect-VIServer