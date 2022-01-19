#!/bin/bash
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
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
echo -e ""
echo -e ""
toilet --gay -f slant -t " Geo Project"
#cat /usr/bin/bannerku | lolcat
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
IPVPS=$(curl -s ipinfo.io/ip )
DOMAIN=$(cat /etc/xray/domain)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
echo -e ""
 echo -e  "  ╔═══════════════════════════════════════════════════════════╗" | lolcat
 echo -e  "  ║                       [ INFORMASI VPS ]                   ║" |lolcat
echo -e  "  ╠═══════════════════════════════════════════════════════════╣"| lolcat
echo -e " $bl ║ ${color1} •${color3}$bd ISP Name          ${color1} :${color3}$bd $ISP"
 echo -e " $bl ║ ${color1} •${color3}$bd City              ${color1} :${color3}$bd $CITY"
 echo -e " $bl ║ ${color1} •${color3}$bd CPU Model         ${color1} :${color3}$bd$cname"
 echo -e " $bl ║ ${color1} •${color3}$bd Number Of Cores   ${color1} :${color3}$bd $cores"
 echo -e " $gl ║ ${color1} •${color3}$bd CPU Frequency     ${color1} :${color3}$bd$freq MHz"
 echo -e " $gl ║ ${color1} •${color3}$bd Total RAM         ${color1} :${color3}$bd $tram MB"
 echo -e " $gl ║ ${color1} •${color3}$bd Waktu             ${color1} :${color3}$bd $jam"
 echo -e " $mg ║ ${color1} •${color3}$bd Hari              ${color1} :${color3}$bd $hari"
 echo -e " $mg ║ ${color1} •${color3}$bd Tanggal           ${color1} :${color3}$bd $tnggl"
 echo -e " $mg ║ ${color1} •${color3}$bd IP VPS            ${color1} :${color3}$bd $IPVPS"
 echo -e " $mg ║ ${color1} •${color3}$bd Domain            ${color1} :${color3}$bd $DOMAIN"
 echo -e " $gl ║ ${color1} •${color3}$bd Version Script    ${color1} :${color3}$bd$bl 3.0.1"
 echo -e  "  ╠══════════════════════════════════════════════════════════╣" | lolcat
 echo -e  "  ║                       [ MENU OPTIONS ]                   ║" |lolcat
 echo -e  "  ╠══════════════════════════════════════════════════════════╣" | lolcat
 echo -e  " $gl ║${color1} 1${color3}.$bd SSH & OpenVPN Section (${color2}menu-ssh${color3})                   $mg   ║"
 echo -e  " $gl ║${color1} 2${color3}.$bd SSTP - L2TP - PPTP - Wireguard Section (${color2}menu-vpn${color3})  $mg   ║"
 echo -e  " $mg ║${color1} 3${color3}.$bd Shadowsocks & ShadowsocksR Section (${color2}menu-shadowsocks${color3}) $mg║"
 echo -e  " $mg ║${color1} 4${color3}.$bd V2ray Vmess & Vless Section (${color2}menu-v2ray${color3})           $mg   ║"
 echo -e  " $bl ║${color1} 5${color3}.$bd Trojan & TrojanGO Section (${color2}menu-trojan${color3})            $mg   ║"
 echo -e  " $bl ║${color1} 6${color3}.$bd Backup Section (${color2}menu-backup${color3})                       $mg   ║"
 echo -e  " $mg ║${color1} 7${color3}.$bd Trial Account Section (${color2}menu-trial${color3})          $mg          ║"
 echo -e  " $mg ║${color1} 8${color3}.$bd System Tools Section (${color2}menu-tools${color3})                  $mg   ║"
 echo -e  " $mg ║${color1} 9${color3}.$bd Update Script Section (${color2}update${color3})                     $mg   ║"
 echo -e  "  \e[1;32m╠══════════════════════════════════════════════════════════╣" | lolcat
 echo -e  " $bl ║${color1} x${color3}.$bd  Exit Main Menu   (${color2}exit${color3})                           $mg   ║" 
 echo -e  "  \e[1;32m╚══════════════════════════════════════════════════════════╝" | lolcat
 echo -e  ""
 read -p "  Please Enter The Number [1-9 or x] :  " menu
echo -e   ""
echo -e   ""
echo -e   ""
case $menu in
1)
menu-ssh
;;
2)
menu-vpn
;;
3)
menu-shadowsocks
;;
4)
menu-v2ray
;;
5)
menu-trojan
;;
6)
menu-backup
;;
7)
menu-trial
;;
8)
menu-tools
;;
9)
update
;;
x)
exit
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
menu
;;
esac
