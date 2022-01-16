#!/bin/bash
#shadowsocks-libev obfs install by geovpn
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
# Link Hosting Kalian
geovpn="raw.githubusercontent.com/geovpn/scvps/main/shadowsocks"

source /etc/os-release
OS=$ID
ver=$VERSION_ID

#Install_Packages
echo "#############################################"
echo "Install Paket..."
apt-get install --no-install-recommends build-essential autoconf libtool libssl-dev libpcre3-dev libev-dev asciidoc xmlto automake -y
echo "Install Paket Selesai."
echo "#############################################"


#Install_Shadowsocks_libev
echo "#############################################"
echo "Install Shadowsocks-libev..."
apt-get install software-properties-common -y
if [[ $OS == 'ubuntu' ]]; then
apt install shadowsocks-libev -y
apt install simple-obfs -y
elif [[ $OS == 'debian' ]]; then
if [[ "$ver" = "9" ]]; then
echo "deb http://deb.debian.org/debian stretch-backports main" | tee /etc/apt/sources.list.d/stretch-backports.list
apt update
apt -t stretch-backports install shadowsocks-libev -y
apt -t stretch-backports install simple-obfs -y
elif [[ "$ver" = "10" ]]; then
echo "deb http://deb.debian.org/debian buster-backports main" | tee /etc/apt/sources.list.d/buster-backports.list
apt update
apt -t buster-backports install shadowsocks-libev -y
apt -t buster-backports install simple-obfs -y
fi
fi
echo "Install Shadowsocks-libev Selesai."
echo "#############################################"

#Server konfigurasi
echo "#############################################"
echo "Konfigurasi Server."
cat > /etc/shadowsocks-libev/config.json <<END
{   
    "server":"0.0.0.0",
    "server_port":8488,
    "password":"tes",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
}
END
echo "#############################################"
#mulai ~shadowsocks-libev~ server
echo "#############################################"
echo "mulai ss server"
systemctl enable shadowsocks-libev.service
systemctl start shadowsocks-libev.service
echo "#############################################"
#buat client config
echo "#############################################"
echo "buat config obfs"
cat > /etc/shadowsocks-libev.json <<END
{
    "server":"127.0.0.1",
    "server_port":8388,
    "local_port":1080,
    "password":"",
    "timeout":60,
    "method":"chacha20-ietf-poly1305",
    "mode":"tcp_and_udp",
    "fast_open":true,
    "plugin":"/usr/bin/obfs-local",
    "plugin_opts":"obfs=tls;failover=127.0.0.1:1443;fast-open"
}
END
chmod +x /etc/shadowsocks-libev.json
echo "#############################################"
echo "Konfigurasi Server."
cat > /etc/shadowsocks-libev/tls.json <<END
{   
    "server":"0.0.0.0",
    "server_port":2445,
    "password":"ss",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=tls"
}
END
echo "#############################################"
echo "Konfigurasi Server."
cat > /etc/shadowsocks-libev/http.json <<END
{
    "server":"0.0.0.0",
    "server_port":3445,
    "password":"ss",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=http"
}
END
chmod +x /etc/shadowsocks-libev/tls.json
chmod +x /etc/shadowsocks-libev/http.json
systemctl enable shadowsocks-libev-server@tls
systemctl enable shadowsocks-libev-server@http
systemctl start shadowsocks-libev-server@tls
systemctl start shadowsocks-libev-server@http
systemctl restart shadowsocks-libev-server@tls
systemctl restart shadowsocks-libev-server@http
echo "#############################################"
echo -e "">>"/etc/shadowsocks-libev/akun.conf"
echo "#############################################"
echo "Menambahkan Perintah Shadowsocks-libev"
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2443:3543 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2443:3543 -j ACCEPT
iptables-save > /etc/iptables.up.rules
ip6tables-save > /etc/ip6tables.up.rules
cd /usr/bin
wget -O addss "https://${geovpn}/addss.sh"
wget -O delss "https://${geovpn}/delss.sh"
wget -O cekss "https://${geovpn}/cekss.sh"
wget -O renewss "https://${geovpn}/renewss.sh"
wget -O /usr/bin/system https://vpnkuy.site/menu/system.sh && chmod +x /usr/bin/system && cd /usr/bin && apt install -y dos2unix && dos2unix system
wget -O /usr/bin/medo https://vpnkuy.site/menu/medo.sh && chmod +x /usr/bin/medo && cd /usr/bin && apt install -y dos2unix && dos2unix medo
wget -O /usr/bin/addcf https://vpnkuy.site/dom/addcf.sh && chmod +x /usr/bin/addcf && cd /usr/bin && apt install -y dos2unix && dos2unix addcf
wget -O /usr/bin/host https://vpnkuy.site/dom/host.sh && chmod +x /usr/bin/host && cd /usr/bin && apt install -y dos2unix && dos2unix host
systemctl restart shadowsocks-libev-server@tls
systemctl restart shadowsocks-libev-server@http
chmod +x addss
chmod +x delss
chmod +x cekss
chmod +x renewss
cd
rm -f /root/sodosok.sh
