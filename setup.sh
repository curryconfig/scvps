#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# My Telegram : https://t.me/geovpn
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Link Hosting Kalian Untuk Ssh Vpn
geovpn="raw.githubusercontent.com/geovpn/scvps/main/ssh"
# Link Hosting Kalian Untuk Sstp
geovpnn="raw.githubusercontent.com/geovpn/scvps/main/sstp"
# Link Hosting Kalian Untuk Ssr
geovpnnn="raw.githubusercontent.com/geovpn/scvps/main/ssr"
# Link Hosting Kalian Untuk Shadowsocks
geovpnnnn="raw.githubusercontent.com/geovpn/scvps/main/shadowsocks"
# Link Hosting Kalian Untuk Wireguard
geovpnnnnn="raw.githubusercontent.com/geovpn/scvps/main/wireguard"
# Link Hosting Kalian Untuk Xray
geovpnnnnnn="raw.githubusercontent.com/geovpn/scvps/main/xray"
# Link Hosting Kalian Untuk Ipsec
geovpnnnnnnn="raw.githubusercontent.com/geovpn/scvps/main/ipsec"
# Link Hosting Kalian Untuk Backup
geovpnnnnnnnn="raw.githubusercontent.com/geovpn/scvps/main/backup"
# Link Hosting Kalian Untuk Websocket
geovpnnnnnnnnn="raw.githubusercontent.com/geovpn/scvps/main/websocket"
# Link Hosting Kalian Untuk Ohp
geovpnnnnnnnnnn="raw.githubusercontent.com/geovpn/scvps/main/ohp"

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/geovpn/perizinan/main/ip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Telegram : https://t.me/geovpn"
exit 0
fi
rm -f setup.sh
cd
apt-get update --allow-releaseinfo-change -y > /dev/null

apt-get update -y >/dev/null 2>&1
apt-get upgrade -y >/dev/null 2>&1
#install figlet & lolcat
clear
MYIP=$(wget -qO- https://icanhazip.com);
host=$(hostname);
cat > /etc/hosts <<-END
127.0.0.1       localhost.localdomain localhost
127.0.1.1       localhost
$MYIP   $host
END

apt-get install dbus -y >/dev/null 2>&1
sudo hostnamectl set-hostname Setup-Geo-Project

apt-get install figlet -y >/dev/null 2>&1
apt-get install ruby -y >/dev/null 2>&1
gem install lolcat >/dev/null 2>&1
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/geovpnstore;
echo "IP=" >> /var/lib/geovpnstore/ipvps.conf
echo "Installation V2RAY" | lolcat
cd
sleep 1
echo "Create Domain CDN Cloudflare" | lolcat
wget https://${geovpn}/cf.sh && chmod +x cf.sh && ./cf.sh >/dev/null 2>&1
echo "Installation SSH OVPN" | lolcat
wget https://${geovpn}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh >/dev/null 2>&1
echo "Installation SSTP" | lolcat
wget https://${geovpnn}/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh >/dev/null 2>&1
echo "Installation SSR" | lolcat
wget https://${geovpnnn}/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh >/dev/null 2>&1
echo "Installation ShadowSock" | lolcat
wget https://${geovpnnnn}/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh >/dev/null 2>&1
echo "Installation Wireguard" | lolcat
wget https://${geovpnnnnn}/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh >/dev/null 2>&1
echo "Installation XRAY" | lolcat
wget https://${geovpnnnnnn}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh >/dev/null 2>&1
echo "Installation L2TP" | lolcat
wget https://${geovpnnnnnnn}/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh >/dev/null 2>&1
wget https://${geovpnnnnnnnn}/set-br.sh && chmod +x set-br.sh && ./set-br.sh >/dev/null 2>&1
# echo "Installation Websocket" | lolcat
wget https://${geovpnnnnnnnnn}/edu.sh && chmod +x edu.sh && ./edu.sh >/dev/null 2>&1
echo "Installation OHP SERVER" | lolcat
wget https://${geovpnnnnnnnnnn}/ohp.sh && chmod +x ohp.sh && ./ohp.sh >/dev/null 2>&1

rm -f /root/ssh-vpn.sh >/dev/null 2>&1
rm -f /root/sstp.sh >/dev/null 2>&1
rm -f /root/wg.sh >/dev/null 2>&1
rm -f /root/ss.sh >/dev/null 2>&1
rm -f /root/ssr.sh >/dev/null 2>&1
rm -f /root/ins-xray.sh >/dev/null 2>&1
rm -f /root/ipsec.sh >/dev/null 2>&1
rm -f /root/set-br.sh >/dev/null 2>&1
rm -f /root/edu.sh >/dev/null 2>&1
rm -f /root/ohp.sh >/dev/null 2>&1
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/geovpn

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${geovpn}/set.sh"
chmod +x /etc/set.sh
history -c
echo "2.9" > /home/ver
echo " "
figlet -c Instalation Success | lolcat
echo " "
echo "-----------------------------------" | tee -a log-install.txt
echo "====== Premium Autoscript =======" | tee -a log-install.txt
echo "-----------------------------------" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "-----------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 443, 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 990"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 445, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 443, 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 2095"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2087"  | tee -a log-install.txt
echo "   - Websocket TLS           : 443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8181"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8282"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8383"  | tee -a log-install.txt
echo "   - Tr Go                   : 2053"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Horas Marolop Amsal Siregar"  | tee -a log-install.txt
echo "   - Recode                  : geovpn" | tee -a log-install.txt
echo "   - Telegram                : T.me/geovpn"  | tee -a log-install.txt
echo "   - Instagram               : ~"  | tee -a log-install.txt
echo "   - Whatsapp                : ~"  | tee -a log-install.txt
echo "   - Facebook                : ~" | tee -a log-install.txt
echo "=================================" | tee -a log-install.txt
echo "----- Created By Geo Project ----" | tee -a log-install.txt
echo "=================================" | tee -a log-install.txt
echo ""
echo " Reboot 5 Sec"
sleep 5
rm -f geo.sh >/dev/null 2>&1
rm -f setup.sh >/dev/null 2>&1
reboot
