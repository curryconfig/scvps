#!/bin/bash
# IP Validation
MYIP=$(wget -qO- icanhazip.com);

# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then 
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
	  lan_net="venet0"
    typevps="OpenVZ"
    sleep 1
else
    clear
		lan_net="eth0"
    typevps="KVM"
    sleep 1
fi

# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
ITAM='\033[0;30m'
echo -e "$ITAM"
NAMAISP=$( curl -s ipinfo.io/org | cut -d " " -f 2-10  )
REGION=$( curl -s ipinfo.io/region )
#clear
COUNTRY=$( curl -s ipinfo.io/country )
#clear
WAKTU=$( curl -s ipinfo.ip/timezone )
#clear
CITY=$( curl -s ipinfo.io/city )
#clear
REGION=$( curl -s ipinfo.io/region )
#clear
WAKTUE=$( curl -s ipinfo.io/timezone )
#clear
koordinat=$( curl -s ipinfo.io/loc )
#clear
NC='\033[0m'
echo -e "$NC"

# CHEK STATUS 
l2tp_status=$(systemctl status xl2tpd | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
#status_openvp=$(/etc/init.d/openvpn status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#status_ss_tls="$(systemctl show shadowsocks-libev-server@tls.service --no-page)"
#ss_tls=$(echo "${status_ss_tls}" | grep 'ActiveState=' | cut -f2 -d=)
sst_status=$(systemctl status shadowsocks-libev-server@tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1) 
ssh_status=$(systemctl status shadowsocks-libev-server@http | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1) 
#status_ss_http="$(systemctl show shadowsocks-libev-server@http.service --no-page)"
#ss_http=$(echo "${status_ss_http}" | grep 'ActiveState=' | cut -f2 -d=)
#sssohtt=$(systemctl status shadowsocks-libev-server@*-http | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#status="$(systemctl show shadowsocks-libev.service --no-page)"
#status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
tls_v2ray_status=$(systemctl status xray@v2ray-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray@v2ray-nontls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray@vless-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray@vless-nontls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssr_status=$(systemctl status ssrmu | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray@trojan | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
sstp_service=$(systemctl status accel-ppp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wg="$(systemctl show wg-quick@wg0.service --no-page)"
swg=$(echo "${wg}" | grep 'ActiveState=' | cut -f2 -d=)
trgo="$(systemctl show trojan-go.service --no-page)"                                      
strgo=$(echo "${trgo}" | grep 'ActiveState=' | cut -f2 -d=)  
sswg=$(systemctl status wg-quick@wg0 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wstls=$(systemctl status ws-stunnel.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-dropbear.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsovpn=$(systemctl status ws-openssh.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
kvpn_status=$(systemctl status ws-openvpn | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
osslh=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohp=$(systemctl status dropbear-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohq=$(systemctl status openvpn-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohr=$(systemctl status ssh-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# COLOR VALIDATION
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear

# STATUS SERVICE Shadowsocks HTTPS
if [[ $sst_status == "running" ]]; then
  status_sst="${GREEN} Service Is Running ${NC}( Aktif )"
else
  status_sst="${RED} Service Is Not Running ${NC}( Not Aktif )"
fi

# STATUS SERVICE Shadowsocks HTTP
if [[ $ssh_status == "running" ]]; then 
   status_ssh="${GREEN} Service Is Running ${NC}( Aktif )"
else
   status_ssh="${RED} Service Is Not Running ${NC}( Not Aktif )"
fi

# STATUS SERVICE OPENVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn="${GREEN} Service Is Running ${NC}( Aktif )"
else
  status_openvpn="${RED} Service Is Not Running ${NC}( Not Aktif )"
fi

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN} Service Is Running ${NC}( Aktif )"
else
   status_ssh="${RED} Service Is Not Running ${NC}( Not Aktif )"
fi

# STATUS SERVICE  SQUID 
if [[ $squid_service == "running" ]]; then 
   status_squid="${GREEN} Service Is Running ${NC}( Aktif )"
else
   status_squid="${RED} Service Is Not Running ${NC}( Not Aktif )"
fi

# STATUS SERVICE  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat="${GREEN} Service Is Running ${NC}( Aktif )"
else
   status_vnstat="${RED} Service Is Not Running ${NC}( Not Aktif )"
fi

# STATUS SERVICE  CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron="${GREEN} Service Is Running ${NC}( Aktif )"
else
   status_cron="${RED} Service Is Not Running ${NC}( Not Aktif )"
fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN} Service Is Running ${NC}( Aktif )"
else
   status_fail2ban="${RED} Service Is Not Running ${NC}( Not Aktif )"
fi

# STATUS SERVICE  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray="${GREEN} Service Is Running${NC} ( Aktif )"
else
   status_tls_v2ray="${RED} Service Is Not Running${NC} ( Not Aktif )"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   status_nontls_v2ray="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE VLESS HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless="${GREEN} Service Is Running${NC} ( Aktif )"
else
  status_tls_vless="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE VLESS HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless="${GREEN} Service Is Running${NC} ( Aktif )"
else
  status_nontls_vless="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# SHADOWSOCKSR STATUS
if [[ $ssr_status == "running" ]] ; then
  status_ssr="${GREEN} Service Is Running${NC} ( Aktif )${NC}"
else
  status_ssr="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# SODOSOK
if [[ $status_text == "active" ]] ; then
  status_sodosok="${GREEN} Service Is Running${NC} ( Aktif )${NC}"
else
  status_sodosok="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE TROJAN
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   status_virus_trojan="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE WIREGUARD
if [[ $swg == "active" ]]; then
  status_wg="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
  status_wg="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Trojan GO
if [[ $strgo == "active" ]]; then
  status_trgo="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
  status_trgo="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE L2TP
if [[ $l2tp_status == "running" ]]; then 
   status_l2tp="${GREEN} Service Is Running${NC} ( Aktif )${NC}"
else
   status_l2tp="${RED} Service Is Not Running${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN} Service Is Running${NC} ( Aktif )${NC}"
else
   status_beruangjatuh="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel="${GREEN} Service Is Running ${NC}( Aktif )"
else
   status_stunnel="${RED} Service Is Not Running ${NC}( Not Aktif )}"
fi

# STATUS SERVICE SSTP
if [[ $sstp_service == "running" ]]; then 
   status_sstp="${GREEN} Service Is Running ${NC}( Aktif )"
else
   status_sstp="${RED} Service Is Not Running ${NC}( Not Aktif )"
fi

# STATUS SERVICE WEBSOCKET TLS
if [[ $wstls == "running" ]]; then 
   swstls="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   swstls="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE WEBSOCKET DROPBEAR
if [[ $wsdrop == "running" ]]; then 
   swsdrop="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   swsdrop="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE WEBSOCKET OPEN OVPN
if [[ $wsovpn == "running" ]]; then 
   swsovpn="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   swsovpn="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE SSLH / SSH
if [[ $osslh == "running" ]]; then 
   sosslh="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   sosslh="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS OHP DROPBEAR
if [[ $ohp == "running" ]]; then 
   sohp="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   sohp="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS OHP OpenVPN
if [[ $ohq == "running" ]]; then 
   sohq="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   sohq="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS OHP SSH
if [[ $ohr == "running" ]]; then 
   sohr="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   sohr="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# STATUS SERVICE WEBSOCKET OPENSSH
if [[ $wsope == "running" ]]; then 
   swsope="${GREEN} Service Is Running ${NC}( Aktif )${NC}"
else
   swsope="${RED} Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# RAM USAGE
total_r2am=` grep "MemAvailable: " /proc/meminfo | awk '{ print $2}'`
MEMORY=$(($total_r2am/1024))

# DOWNLOAD
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))

# UPLOAD
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))

# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# TIPE PROCESSOR
totalcore="$(grep -c "^processor" /proc/cpuinfo)" 
totalcore+=" Core"
corediilik="$(grep -c "^processor" /proc/cpuinfo)" 
tipeprosesor="$(awk -F ': | @' '/model name|Processor|^cpu model|chip type|^cpu type/ {
                        printf $2;
                        exit
                        }' /proc/cpuinfo)"

# SHELL VERSION
shellversion=""
shellversion=Bash
shellversion+=" Version" 
shellversion+=" ${BASH_VERSION/-*}" 
versibash=$shellversion

# GETTING CPU INFORMATION
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

# OS UPTIME
uptime="$(uptime -p | cut -d " " -f 2-10)"

# KERNEL TERBARU
kernelku=$(uname -r)

# WAKTU SEKARANG 
harini=`date -d "0 days" +"%d-%m-%Y"`
jam=`date -d "0 days" +"%X"`

# DNS PATCH
tipeos2=$(uname -m)

# GETTING DOMAIN NAME
Domen="$(cat /etc/xray/domain)"

# ECHOING RESULT
echo -e ""
echo -e "IN HERE IS YOUR VPS INFORMATION : " | lolcat 
echo "----------------------------------------------------------------" | lolcat 
echo "Operating System Information :" | lolcat 
echo -e "Hostname    : $HOSTNAME"
echo -e "OS Name     : $Tipe"
echo -e "Processor   : $tipeprosesor"
echo -e "Proc Core   : $totalcore"
echo -e "Virtual     : $typevps"
echo -e "Cpu Usage   : $cpu_usage"
echo -e "Total RAM   : ${totalram}MB"
echo -e "Avaible     : ${MEMORY}MB"
echo -e "Public IP   : $MYIP"
echo -e "Domain      : $Domen"
echo -e "ISP Name    : $NAMAISP"
echo -e "Region      : $REGION "
echo -e "Country     : $COUNTRY"
echo -e "Date        : $harini"
echo -e "Time        : $jam ( WIB )"
echo "----------------------------------------------------------------" | lolcat 
echo "SYSTEM STATUS INFORMATION :" | lolcat 
echo -e "SSH / Tun          : $status_ssh"
echo -e "OpenVPN            : $status_openvpn"
echo -e "Dropbear           : $status_beruangjatuh"
echo -e "Stunnel            : $status_stunnel"
echo -e "Squid              : $status_squid"
echo -e "Fail2Ban           : $status_fail2ban"
echo -e "Crons              : $status_cron"
echo -e "Vnstat             : $status_vnstat"
echo -e "L2TP               : $status_l2tp"
echo -e "SSTP               : $status_sstp"
echo -e "V2Ray TLS          : $status_tls_v2ray"
echo -e "V2Ray HTTP         : $status_nontls_v2ray"
echo -e "Vless TLS          : $status_tls_vless"
echo -e "Vless HTTP         : $status_nontls_vless"
echo -e "SSR                : $status_ssr"
echo -e "Shadowsocks  HTTPS : $status_sst"
echo -e "Shadowsocks  HTTP  : $status_ssh"
echo -e "Trojan             : $status_virus_trojan"
echo -e "Trojan GO          : $status_trgo"
echo -e "Wireguard          : $status_wg"
echo -e "Websocket TLS      : $swstls"
echo -e "Websocket Dropbear : $swsdrop"
echo -e "Websocket Ovpn     : $swsovpn"
echo -e "OHP Dropbear       : $sohp"
echo -e "OHP OpenVPN        : $sohq"
echo -e "OHP SSH            : $sohr"
echo -e "SSL/SSH Multiplexer: $sosslh"
echo "----------------------------------------------------------------" | lolcat 
echo ""
