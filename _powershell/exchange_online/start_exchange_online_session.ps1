#Required modules in order to use script

Install-Module PowershellGet -Force
Install-Module -Name ExchangePowerShell
Install-Module -Name ExchangeOnlineManagement

#Connect to Exchange Online (will prompt for M365 login)

$credentials = get-credential
Connect-ExchangeOnline -Credential $credentials

#Create new PowerShell Session for Exchange Online
$SccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $credentials -Authentication "Basic" -AllowRedirection

#Imports the PowerShell Session
Import-PSSession $SccSession