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
NC='\x1b[m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
COUNTRY=$(curl -s ipinfo.io/country )

MYIP=$(wget -qO- ipinfo.io/ip);
clear
uuid=$(cat /etc/trojan-go/uuid.txt)
clear
uuid=$(cat /etc/trojan-go/uuid.txt)
source /var/lib/geovpnstore/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
trgo="$(cat ~/log-install.txt | grep -w "Tr Go" | cut -d: -f2|sed 's/ //g')"
# Create Expried 
masaaktif="1"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# Make Random Username 
user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
users="Trojan-GO_$user"
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan-go/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan-go/akun.conf
echo -e "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart trojan-go
systemctl restart trojan
link="trojan-go://${user}@${domain}:${trgo}/?sni=${domain}&type=ws&host=${domain}&path=/trojango&encryption=none#$user"
cat > client.json << END
{
    "run_type": "client",
    "local_addr": "127.0.0.1",
    "local_port": 1080,
    "remote_addr": "${domain}",
    "remote_port": ${trojango},
    "dns": [
        "1.1.1.1"
    ],
    "password": [
        "${users}"
    ],
    "ssl": {
        "sni": "${domain}"
    },
    "websocket": {
        "enabled": true,
        "path": "\/trojango",
        "hostname": "${domain}"
    }
}
END
clear
echo -e ""
echo -e "${red}=================================${off}"
echo -e "${blue} ~>    TRIAL TROJAN-GOVPN${off}"
echo -e "${red}=================================${off}"
echo -e "Remarks    : ${user}"
echo -e "IP/Host    : ${MYIP}"
echo -e "Address    : ${domain}"
echo -e "Port       : ${trgo}"
echo -e "Key        : ${user}"
echo -e "Encryption : none"
echo -e "Path       : /trojango"
echo -e "${red}=================================${off}"
echo -e "Link TrGo  : ${link}"
echo -e "${red}=================================${off}"
echo -e " Aktif Selama     : $masaaktif Hari"
echo -e "${red}=================================${off}"
echo -e " ${blue}- Mod By Geo Gabut${off}"
echo -e ""
