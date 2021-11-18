# Assign the PSTN calling licnese to the user 
Set-MsolUserLicense -UserPrincipalName USERNAME@DOMAINNAME.TLD -AddLicense "TENANT:MCOPSTN1"

# Assigns the user to the Emergency MS Teams Policy for E911
Grant-CsTeamsEmergencyCallingPolicy -Identity USERNAME@DOMAINNAME.TLD -PolicyName "NAME_OF_ECP_POLICY_NAME"

#Enables Enterprise Voice and Hosted Voicemail
Set-CsUser -Identity USERNAME@DOMAINNAME.TLD -EnterpriseVoiceEnabled $True -HostedVoiceMail $True

# Assigns phone number to user with the desired location ID
#LocationID is a GUID from SFB Online
Set-CsOnlineVoiceUser -Identity USERNAME@DOMAINNAME.TLD -TelephoneNumber +12345678901 -LocationID 00000000-0000-0000-0000-000000000000

# Set user(s) to Teams Only
Grant-CsTeamsUpgradePolicy -PolicyName UpgradeToTeams -Identity USERNAME@DOMAINNAME.TLD