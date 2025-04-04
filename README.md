Automated Exploitation of Administrator HTB Machine

Overview

This script automates the exploitation process for the Administrator machine on Hack The Box (HTB). It performs the following steps:

DCSync Attack - Extracts NTLM hashes using impacket-secretsdump.

Hash Extraction - Filters out the Administrator NTLM hash.

Evil-WinRM Access - Uses the extracted hash to establish a remote shell.

Requirements

Ensure you have the following installed:

Impacket

Evil-WinRM

Bash

Usage

1. Setup

Clone the repository and navigate to the script directory:

git clone https://github.com/jagsha/htb-administrator-automated-walkthrough.git
cd htb-admin-exploit

2. Edit Configuration

Modify the exploit.sh file with the target DOMAIN, IP Address, and User Credentials.

nano exploit.sh

Set the following values:

DOMAIN="htb.local"
IP="10.10.10.X"
USER="ethan"
PASSWORD="limpbizkit"

3. Run the Exploit

Give execution permission and run the script:

chmod +x exploit.sh
./exploit.sh

4. Successful Exploitation

If the attack is successful, you will get an Evil-WinRM shell as the Administrator:

*Evil-WinRM* PS C:\Users\Administrator\Desktop>

Notes

Ensure you have network connectivity to the target machine.

The script automates NTLM hash extraction and WinRM access, reducing manual effort.

Modify grep or cut commands if needed, depending on output format changes.

Disclaimer

This script is for educational purposes only. Unauthorized access to systems is illegal. Use this knowledge responsibly!

