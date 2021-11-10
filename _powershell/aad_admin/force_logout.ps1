#Conencts to Azure AD
Connect-AzureAD

#Imports a CSV of users, place all users in the CSV file under UserPrincipalName
#This will log anyone on the list out of Azure AD
Import-CSV “force_logout_list.csv” | % {Get-AzureADUser -SearchString $_.UserPrincipalName | Revoke-AzureADUserAllRefreshToken}