# Use this to have Linux Mint use SMB v3 when connecting to network shares, by default it does not as of Linux Mint 20.1
#!/bin/bash
cd /etc/samba/smb.conf
while IFS= read -r line
do

# find [global] and add max client under it
if [ "$line" != "client max protocol = SMB3" ]; then
     if [ "$line" = "[global]" ]; then
     	echo "[global]" >> other.txt
	echo "client max protocol = SMB3" >> other.txt
     elif [ "$line" = "   workgroup = WORKGROUP" ]; then
     	echo "workgroup = TRAILERPARK" >> other.txt
     else
	echo "$line" >> other.txt
     fi
fi

# end of loop
done < smb.conf


#cleanup temporary files
rm smb.conf
mv other.txt smb.conf
