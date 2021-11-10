# This is a four part script
#
# Part 1 
# * Connects to MS Online Services
#
./part1_connect_to_sfbonline.ps1
#
# Part 2 
# * Assigns the PSTN calling licnese to the user 
# * Assigns the users phone number with the desired location ID
# * Assigns the desired emergency MS Teams Policy for E911
#
./part2_prep_account_and_set_services.ps1
#
# Part 3
# * Assigns the users phone number in MS Teams
#
./part3_assign_phone_number.ps1
#
# * Moves the user from Skype for Business on-prem / Skype for Business Online to MS Teams
#
./part4_move_users_from_sfb_to_teams.ps1