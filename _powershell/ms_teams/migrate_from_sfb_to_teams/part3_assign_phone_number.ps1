# Grab CSV file for processing
$users = Import-CSV -Path .\list.csv

foreach ($user in $users) {

# Assigns phone number to user with the Denny location ID
# -Identity example is USERNAME@DOMAIN.TLD - The script references an external .csv file
# -TelephoneNumber arguement uses the phone number with dashes (-'s) with a plus (+) in the beginning. The below example references an external .csv file
# -LocationID arguement utilizes the GUID (hexadecimal value) for the site that can be found in the MS Teams Admin Center
Set-CsOnlineVoiceUser -Identity $user.UserPrincipalName -TelephoneNumber ($user.PhoneNumber) -LocationID 00000000-0000-0000-0000-000000000000

}