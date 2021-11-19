# Grab CSV file for processing
$users = Import-CSV -Path .\list.csv

foreach ($user in $users) {

# Assign the PSTN calling licnese to the user 
Set-MsolUserLicense -UserPrincipalName $user.UserPrincipalName -AddLicense "ONMICROSOFT_TENANT_NAME:MCOPSTN1"

# Assigns the user to the Emergency MS Teams Policy for E911
Grant-CsTeamsEmergencyCallingPolicy -Identity $user.UserPrincipalName -PolicyName "NAME_OF_ECP_POLICY"

#Enables Enterprise Voice and Hosted Voicemail
Set-CsUser -Identity $user.UserPrincipalName -EnterpriseVoiceEnabled $True -HostedVoiceMail $True

}