#Do not use .OVA files as they currently do not work with this method, extract the .OVA files using 7-Zip and then point the cmdlets to the .OVF file that is extracted:

# example path "C:\_vmware\win11-client-01\win11-client-01.ovf" without quotes.
Write-Host "`n"
Write-Host "This script allows a VM to be imported into vmWare." -foregroundcolor Green -backgroundcolor Black
Write-Host "`n"
$confirmation = Read-Host "Press Y to proceed or any other key to exit"

if ($confirmation -eq 'y') {
    # proceed
    Write-Host "`n"
    Write-Host "================" -foregroundcolor Green -backgroundcolor Black
    Write-Host "Running Script." -foregroundcolor Green -backgroundcolor Black
    Write-Host "================" -foregroundcolor Green -backgroundcolor Black
}
if ($confirmation -ne 'y') {
    Write-Host "`n"
    Write-Host "================" -foregroundcolor Red -backgroundcolor Black
    Write-Host "Stopping Script." -foregroundcolor Red -backgroundcolor Black
    Write-Host "================" -foregroundcolor Red -backgroundcolor Black
    Write-Host "`n"

    Break Script

}

Write-Host "`n"
$sourceFile = Read-Host -Prompt 'Input the path to the .OVF file you wish to upload.'

# Use hostname or FQDN for the vSphere / ESXi host:
Write-Host "`n"
$esxServerName = Read-Host -Prompt 'Input the name of your vSphere / ESXi server.'

Write-Host "`n"
$vmNewName = Read-Host -Prompt 'Name the VM you wish to upload.'
Write-Host "`n"
Write-Host "==========================================================" -foregroundcolor Yellow -backgroundcolor Black
Write-Host "         The script will now ask for credentials.         " -foregroundcolor Yellow -backgroundcolor Black
Write-Host "==========================================================" -foregroundcolor Yellow -backgroundcolor Black
Write-Host "`n"
Write-Host "Connecting to vSphere / ESXi host." -foregroundcolor green -backgroundcolor black

Connect-VIServer -Server $esxServerName

# Imports the vApp with the varibles above
Import-vApp -Source $sourceFile -VMHost $esxServerName -Name $vmNewName
Write-Host "`n"
Write-Host "$vmNewName has been successfully uploaded!" -foregroundcolor green -backgroundcolor black
Write-Host "`n"

$turnOnVM = Read-Host "Would you like to power on the VM?"

if ($turnOnVM -eq 'y') {
    # proceed
    Write-Host "`n"
    Write-Host "============================================" -foregroundcolor green -backgroundcolor black
    Write-Host "$vmNewName is powering on." -foregroundcolor Green -backgroundcolor Black
    Write-Host "============================================" -foregroundcolor green -backgroundcolor black
    Write-Host "`n"

    Start-VM -VM $vmNewName -Confirm:$false
}

if ($turnOnVM -ne 'y') {
    Write-Host "`n"
    Write-Host "=============================================" -foregroundcolor Yellow -backgroundcolor Black
    Write-Host "$vmNewName will stay off." -foregroundcolor Yellow -backgroundcolor Black
    Write-Host "=============================================" -foregroundcolor Yellow -backgroundcolor Black
    Write-Host "`n"

    Break Script
}