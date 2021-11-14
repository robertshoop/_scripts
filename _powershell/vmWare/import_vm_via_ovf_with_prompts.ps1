#Do not use .OVA files as they currently do not work with this method, extract the .OVA files using 7-Zip and then point the cmdlets to the .OVF file that is extracted:

#Variables are below for refernece:
#
# example path "C:\_vmware\win11-client-01\win11-client-01.ovf" without quotes.
Write-Host "`n"
$sourceFile = Read-Host -Prompt 'Input the path to the .OVF file you wish to upload to your vSphere / ESXi server.'
#
# example "buzzesx01" without quotes.
Write-Host "`n"
$esxServerName = Read-Host -Prompt 'Input the name of your vSphere / ESXi server.'
#
# exmaple "win11-client-03" without quotes.
Write-Host "`n"
$vmNewName = Read-Host -Prompt 'Name the VM you wish to upload.'
Write-Host "`n"
Write-Host "******* You will be prompted for credentials. *******" -foregroundcolor yellow -backgroundcolor black
Write-Host "`n"
Write-Host "Connecting to vSphere / ESXi host." -foregroundcolor green -backgroundcolor black

Connect-VIServer -Server $esxServerName

# Import the vApp with the varibles above
Import-vApp -Source $sourceFile -VMHost $esxServerName -Name $vmNewName

# Disconnect from the vSphere Server
Disconnect-VIServer

Write-Host "Your VM has been successfully uploaded!" -foregroundcolor green -backgroundcolor black