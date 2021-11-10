# Grab CSV file for processing
$users = Import-CSV -Path .\list.csv

#URL for M365
$url="https://admin1a.online.lync.com/HostedMigration/hostedmigrationService.svc"

foreach ($user in $users) {

# Moves users from On-prem Skype for Business to MS Teams
Move-CsUser -Identity $user.UserPrincipalName -Target sipfed.online.lync.com -MoveToTeams -HostedMigrationOverrideUrl https://admin1a.online.lync.com/HostedMigration/hostedmigrationService.svc -UseOAuth -force

}