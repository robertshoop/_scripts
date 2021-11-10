$gpoName = "STING_VALUE_FOR_GPO_NAME"
$gpoTarget = "User"
$gpoTargetType = "Computer"
$gpoTargetName = "COMPUTERNAMEHERE"
$dcServer = "DOMAINCONTROLLER.DOMAIN.TLD"


#To apply a setting to a GPO
Set-GPPermissions -Name $gpoName -PermissionLevel GpoApply -TargetName $gpoTargetName -TargetType $gpoTargetType -Server $dcServer 