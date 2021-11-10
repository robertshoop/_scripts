$userAccount = "USERACCOUNT@DOMAIN.TLD"
(Get-MsolUser -UserPrincipalName $userAccount).Licenses.ServiceStatus