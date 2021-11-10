#Required modules to be loaded in order to use script
Import-Module SkypeOnlineConnector

#Creates the session for Skype for Business Online
$O365session = New-CsOnlineSession -OverrideAdminDomain TENANTSUBDOMAIN.onmicrosoft.com -Credential $O365Creds

#Imports the PowerShell Session
Import-PSSession $O365session

#Enable the Skype for Business online session
Enable-CsOnlineSessionForReconnection

#Connect to MS Online Services
Connect-MSOLService