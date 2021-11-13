#Windows 11 VM Notes (Do not do in production):

Referenced from https://www.ivobeerens.nl/2021/10/06/install-windows-11-as-vm-in-vmware-vsphere-workstation-without-tpm-2-0/

Start Windows Setup and get to the point where setup throws an error about not having a TPM, then perform the following:

* Navigate to HKEY_LOCAL_MACHINE\SYSTEM\Setup and create a new Key named LabConfig
* Create in the LabConfig Key a ByPassTPMCheck DWORD (32-bit) with the value of 1
* Close the Regedit window (click on the Red X in the right corner)
* Type exit to leave the command prompt
* Click on the Red X in the right corner and the setup will start again