#Required modules in order to use script

Install-Module PowershellGet -Force
Install-Module -Name ExchangePowerShell
Install-Module -Name ExchangeOnlineManagement

#Connect to Exchange Online (will prompt for M365 login)
$credentials = get-credential
Connect-ExchangeOnline -Credential $credentials

#Create new PowerShell Session for Exchange Online
$m365Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ `
-Credential $credentials -Authentication "Basic" -AllowRedirection

#Imports the PowerShell Session
Import-PSSession $m365Session

# Used Varibles

#Pulls current date and time
$dateTime = Get-Date -DisplayHint Time

#Asks what the query should be named
$searchQueryName = Read-Host -Prompt 'Enter the name of your search query'

#Asks what text needs to be searched
$contentSearchQuery = Read-Host -Prompt 'Enter the text you are searching for'

#Combines $searchQueryName with $dateTime and adds a space between the two
$submittedQueryName = $searchQueryName + " " + $dateTime

# Defines the compliance search

Write-Host ""
Write-Host "Creating new compliance search"

New-ComplianceSearch -Name $submittedQueryName -ExchangeLocation All -ContentMatchQuery $contentSearchQuery

Start-Sleep -Seconds 30

# Starts the compliance search

Write-Host "Starting the new compliance search"

Start-ComplianceSearch -Identity "$submittedQueryName"

Write-Host " "
Write-Host "Waiting 6 minutes for the search to complete"
Write-Host ""

# Sleep timer for 6 minutes

Start-Sleep -Seconds 360

# Purges results from the compliance search

Write-Host "Any email containing the text $contentSearchQuery is being purged"
Write-Host ""

New-ComplianceSearchAction -SearchName $submittedQueryName -Purge -PurgeType SoftDelete -Confirm:$false