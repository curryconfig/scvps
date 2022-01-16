#!/bin/bash
grey='\x1b[90m'
red='\x1b[91m'
green='\x1b[92m'
yellow='\x1b[93m'
blue='\x1b[94m'
purple='\x1b[95m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'
flag='\x1b[47;41m'

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

MYIP=$(wget -qO- ipinfo.io/ip);
clear
uuid=$(cat /etc/trojan/uuid.txt)
clear
source /var/lib/geovpnstore/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
sed -i '/#xray-trojan$/a\### '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/xray/trojan.json
systemctl restart xray@trojan
trojanlink="trojan://${user}@${domain}:2087"
service cron restart
clear
echo -e ""
echo -e "${red}=================================${off}"
echo -e "===========-XRAYS/TROJAN-============="
echo -e "${red}=================================${off}"
echo -e "Remarks  : ${user}"
echo -e "IP/Host  : ${MYIP}"
echo -e "Address  : ${domain}"
echo -e "Port     : 2087"
echo -e "Key      : ${user}"
echo -e "${red}=================================${off}"
echo -e "Link TR  : ${trojanlink}"
echo -e "${red}=================================${off}"
echo -e "${red}=================================${off}"
echo -e " ${white}Aktif Selama   : $masaaktif Hari"
echo -e "${red}=================================${off}"

