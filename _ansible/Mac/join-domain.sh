command: "dsconfigad -force -add {{ shoop.local }} -computer {{ mac01 }}\
 -username {{ user }} -password {{ Abcde12345! }} -ou {{ COMPUTERS }}\
 -mobile enable -mobileconfirm disable -localhome enable -useuncpath enable\
 -groups 'Domain Admins' -shell /bin/bash "