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
source /var/lib/geovpnstore/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
read -rp "Bug: " -e bug
tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
user=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c2`
uuid=$(cat /proc/sys/kernel/random/uuid)
tnggl=$(date +"%R")
read -p "Expired (Jam): " ktf
exp=`date -d "$ktf hour" +"%R"`
sed -i '/#xray-v2ray-tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/v2ray-tls.json
sed -i '/#xray-v2ray-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/v2ray-nontls.json
cat>/etc/xray/v2ray-$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "geo",
      "type": "none",
      "host": "",
      "tls": "none"
}
EOF
cat>/etc/xray/v2ray-$user-nontls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${bug}",
      "port": "${nontls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "geo",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
xrayv2ray1="vmess://$(base64 -w 0 /etc/xray/v2ray-$user-tls.json)"
xrayv2ray2="vmess://$(base64 -w 0 /etc/xray/v2ray-$user-nontls.json)"
systemctl restart xray@v2ray-tls
systemctl restart xray@v2ray-nontls
service cron restart
clear
echo -e ""
echo -e "${cyan}==================================${off}"
echo -e "${purple} ~> TRIAL V2RAY VMESS${off}"
echo -e "${cyan}==================================${off}"
echo -e " Remarks        : ${user}"
echo -e " Bug            : ${bug}"
echo -e " Domain         : ${domain}"
echo -e " Port TLS       : ${tls}"
echo -e " Port No TLS    : ${nontls}"
echo -e " ID             : ${uuid}"
echo -e " AlterID        : 0"
echo -e " Security       : auto"
echo -e " Network        : ws"
echo -e " Path           : geo${off}"
echo -e "${cyan}==================================${off}"
echo -e "${purple}~> VMESS TLS : $off${xrayv2ray1}"
echo -e "${cyan}==================================${off}"
echo -e "${purple}~> VMESS NON-TLS : $off${xrayv2ray2}"
echo -e "${cyan}==================================${off}"
echo -e " ${green}Aktif Selama   : $ktf Jam"
echo -e "${cyan}==================================${off}"
echo -e ""
