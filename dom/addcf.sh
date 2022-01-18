#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'

#Input Domain
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/geovpn/perizinan/main/ip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Telegram : https://t.me/sampiiiiu"
exit 0
fi
clear
echo ""
echo -e "${BLUE}==========================================================${NC}"
figlet Add Domain | lolcat
echo -e "${BLUE}==========================================================${NC}"
echo ""
echo "Please Input Your Pointing Domain In Cloudflare "
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/geovpnstore/ipvps.conf
#rm -f /home/homain
echo "$host" > /etc/xray/domain
echo -e "[${GREEN}Done${NC}]"

#Update Sertificate SSL
echo "Automatical Update Your Sertificate SSL"
sleep 3
echo Starting Update SSL Sertificate
sleep 0.5
source /var/lib/geovpnstore/ipvps.conf
domain=$IP
systemctl stop xray@v2ray-tls
systemctl stop xray@v2ray-nontls
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/v2ray.crt --keypath /etc/xray/v2ray.key --ecc
systemctl stop xray@v2ray-tls
systemctl stop xray@v2ray-nontls

#Done
echo -e "[${GREEN}Done${NC}]"
echo "Location Your Domain : /etc/xray/domain"
echo ""
echo -e "${BLUE}Script By GEO GABUT ANAK NTB${NC}"
