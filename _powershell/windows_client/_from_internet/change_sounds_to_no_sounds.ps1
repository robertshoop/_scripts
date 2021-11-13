#Taken from https://superuser.com/questions/1300539/change-sound-scheme-in-windows-via-windows-registry and modified:

Write-Host "`n"

$confirmation = Read-Host "This script will set the default sound scheme in Windows to the **No Sound** scheme. Would you like to proceed?"

if ($confirmation -eq 'y') {
    # proceed
    Write-Host "`n"
    Write-Host "Running Script. " -foregroundcolor green -backgroundcolor black
}
if ($confirmation -ne 'y') {
    Write-Host "`n"
    Write-Host "Stopping Script. " -foregroundcolor red -backgroundcolor black
    Write-Host "`n"
    Break Script

}

Write-Host "`n"
Write-Host "Setting Sound Schemes to 'No Sound' .." -foregroundcolor Gray -backgroundcolor black
Write-Host "`n"

# Setting Get-ChildItem registry path

$Path = "HKCU:\AppEvents\Schemes"

$Keyname = "(Default)"

$SetValue = ".None"

$TestPath = Test-Path $Path
if (-Not($TestPath -eq $True)) {
   Write-Host " Creating Folder.. " -foregroundcolor Gray -backgroundcolor black
   New-item $path -force
}

if (Get-ItemProperty -path $Path -name $KeyName -EA SilentlyContinue) {

   $Keyvalue = (Get-ItemProperty -path $Path).$keyname

   if ($KeyValue -eq $setValue) {
       
       Write-Host " The Registry Key Already Exists. " -foregroundcolor green -backgroundcolor black
       Write-Host "`n"
   }
   else {

       Write-Host " Changing Key Value.. " -foregroundcolor Gray -backgroundcolor black
       Write-Host "`n"

       New-itemProperty -path $Path -Name $keyname -value $SetValue -force # Set 'No Sound' Schemes
       Get-ChildItem -Path "HKCU:\AppEvents\Schemes\Apps" | # Apply 'No Sound' Schemes
        Get-ChildItem |
        Get-ChildItem |
        Where-Object { $_.PSChildName -eq ".Current" } |
        Set-ItemProperty -Name "(Default)" -Value ""

       Write-Host "The Registry Key Value Changed Sucessfully. " -foregroundcolor green -backgroundcolor black
   }

}
else {

   Write-Host " Creating Registry Key.. " -foregroundcolor Gray -backgroundcolor black

   New-itemProperty -path $Path -Name $keyname -value $SetValue -force
   Get-ChildItem -Path "HKCU:\AppEvents\Schemes\Apps" |
       Get-ChildItem |
       Get-ChildItem |
       Where-Object { $_.PSChildName -eq ".Current" } |
       Set-ItemProperty -Name "(Default)" -Value ""


   Write-Host "The Registry Key Created Sucessfully. " -foregroundcolor green -backgroundcolor black
}