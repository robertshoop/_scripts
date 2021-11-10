$domainandou = 'OU=SubOU,DC=domainName,DC=tld'

Get-ADComputer -SearchBase $domainandou -Filter {OperatingSystem -Like "Windows *Server*"} -Property * | Format-Table Name,OperatingSystem -Wrap -Auto