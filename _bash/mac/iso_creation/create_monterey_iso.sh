# Tested on 11-29-2021 with Mac OS Monterey 12.1 beta with success
echo
echo "This script will assit with creating a .ISO file of Mac OS Monterey and place the file on your desktop."
echo
echo "This script assumes that you have already downloaded the Mac OS Monterey installer from the AppStore."
echo

# Creates a .DMG file for Monterey
sudo hdiutil create -o /tmp/Monterey -size 16384m -volname Monterey -layout SPUD -fs HFS+J

# Attaches the Mac OS Monterey ISO located in /tmp from the last command to /Volumes/Monterey
sudo hdiutil attach /tmp/Monterey.dmg -noverify -mountpoint /Volumes/Monterey

# Reformats the .dmg volume to be bootable
sudo sudo /Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/Monterey --nointeraction

hdiutil eject -force /Volumes/Install\ macOS\ Monterey

# Converts .dmg file to .iso
hdiutil convert /tmp/Monterey.dmg -format UDTO -o ~/Desktop/Monterey
mv -v ~/Desktop/Monterey.cdr ~/Desktop/Monterey.iso

# Removes the Monterey.dmg file
sudo rm -fv /tmp/Monterey.dmg