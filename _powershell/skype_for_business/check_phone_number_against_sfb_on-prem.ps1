Get-CsCommonAreaPhone | where {$_.LineURI -eq "tel:+12345678901"} | Sort-Object LineURI | Select-Object Identity, LineURI, DisplayNumber, DisplayName, Description

Get-CsUser | where {$_.LineURI -eq "tel:+12345678901" -or $_.PrivateLine -eq “tel:+12345678901"} | Sort-Object LineURI | Select-Object Displayname, LineURI, PrivateLine

Get-CsRgsWorkflow | where {$_.LineURI -eq "tel:+12345678901"} | Sort-Object LineURI | Select-Object Name, Identity, LineURI, DisplayNumber, Description